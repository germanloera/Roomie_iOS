//
//  InputFormat.swift
//  TrustedRoomie
//
//  Created by Antigravity on 11/26/26.
//

import SwiftUI
import UIKit

/// Define las opciones de máscara y formato en vivo para campos de entrada de texto.
public enum InputFormat: Equatable, Sendable {
    case none
    case phone(mask: String = "(###) ### ####", maskChar: Character = "#")
    case number(allowDecimals: Bool = false, maxDecimals: Int = 2)
    case currency(symbol: String = "$", maxDecimals: Int = 2)
    case customMask(mask: String, maskChar: Character = "#")

    // MARK: - Keyboard Mapping

    /// Retorna el tipo de teclado de UIKit recomendado para el formato.
    public var keyboardType: UIKeyboardType {
        switch self {
        case .none:
            return .default
        case .phone:
            return .phonePad
        case .number(let allowDecimals, _):
            return allowDecimals ? .decimalPad : .numberPad
        case .currency:
            return .decimalPad
        case .customMask:
            return .default
        }
    }

    // MARK: - Format & Raw Conversions

    /// Convierte una entrada arbitraria (tecleada o copiada) a su valor crudo (raw) limpio de símbolos o máscaras.
    public func sanitizeToRaw(_ input: String) -> String {
        switch self {
        case .none:
            return input

        case .phone:
            // Conservar únicamente dígitos
            return input.filter { $0.isNumber }

        case .number(let allowDecimals, let maxDecimals):
            return sanitizeNumber(input, allowDecimals: allowDecimals, maxDecimals: maxDecimals)

        case .currency(_, let maxDecimals):
            return sanitizeNumber(input, allowDecimals: true, maxDecimals: maxDecimals)

        case .customMask(let mask, let maskChar):
            // Extraer solo los caracteres que corresponden a posiciones del maskChar
            let maskLiterals = Set(mask.filter { $0 != maskChar })
            return input.filter { !maskLiterals.contains($0) }
        }
    }

    /// Toma un valor crudo (raw) y devuelve la versión formateada para mostrar en pantalla.
    public func format(rawText: String) -> String {
        guard !rawText.isEmpty else { return "" }

        switch self {
        case .none:
            return rawText

        case .phone(let mask, let maskChar):
            return applyMask(rawText: rawText, mask: mask, maskChar: maskChar)

        case .customMask(let mask, let maskChar):
            return applyMask(rawText: rawText, mask: mask, maskChar: maskChar)

        case .number(_, _):
            return formatNumber(rawText: rawText)

        case .currency(let symbol, _):
            let formattedNumber = formatNumber(rawText: rawText)
            if formattedNumber.isEmpty { return "" }
            return "\(symbol) \(formattedNumber)"
        }
    }

    // MARK: - Private Helpers

    private func sanitizeNumber(_ input: String, allowDecimals: Bool, maxDecimals: Int) -> String {
        // Normalizar comas a puntos decimales
        let normalized = input.replacingOccurrences(of: ",", with: ".")
        var result = ""
        var hasDecimalPoint = false
        var decimalDigitsCount = 0

        for char in normalized {
            if char.isNumber {
                if hasDecimalPoint {
                    if decimalDigitsCount < maxDecimals {
                        result.append(char)
                        decimalDigitsCount += 1
                    }
                } else {
                    result.append(char)
                }
            } else if char == "." && allowDecimals && !hasDecimalPoint {
                hasDecimalPoint = true
                if result.isEmpty {
                    result.append("0") // ".5" -> "0.5"
                }
                result.append(char)
            }
        }
        return result
    }

    private func formatNumber(rawText: String) -> String {
        guard !rawText.isEmpty else { return "" }

        let components = rawText.split(separator: ".", omittingEmptySubsequences: false)
        guard let integerPart = components.first else { return "" }

        let cleanIntegerDigits = String(integerPart).filter { $0.isNumber }
        guard let number = Int64(cleanIntegerDigits) else {
            return rawText
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        let formattedInteger = formatter.string(from: NSNumber(value: number)) ?? String(number)

        if components.count > 1 {
            // Conservar el separador decimal y los decimales escritos hasta ahora
            let decimalPart = components[1]
            return "\(formattedInteger).\(decimalPart)"
        } else if rawText.hasSuffix(".") {
            // Si el usuario acaba de escribir el punto decimal, conservarlo visualmente
            return "\(formattedInteger)."
        }

        return formattedInteger
    }

    private func applyMask(rawText: String, mask: String, maskChar: Character) -> String {
        var result = ""
        var rawIndex = rawText.startIndex

        for maskCharItem in mask {
            guard rawIndex < rawText.endIndex else { break }

            if maskCharItem == maskChar {
                result.append(rawText[rawIndex])
                rawIndex = rawText.index(after: rawIndex)
            } else {
                result.append(maskCharItem)
            }
        }

        return result
    }
}
