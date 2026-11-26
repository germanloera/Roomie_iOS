//
//  InputRestriction.swift
//  TrustedRoomie
//
//  Created by Antigravity on 11/26/26.
//

import Foundation

/// Representa una regla o restricción de validación para campos de entrada de texto.
public struct InputRestriction: Identifiable, Sendable {
    public let id: String
    public let errorMessage: String
    public let validator: @Sendable (String) -> Bool

    public init(
        id: String,
        errorMessage: String,
        validator: @escaping @Sendable (String) -> Bool
    ) {
        self.id = id
        self.errorMessage = errorMessage
        self.validator = validator
    }

    // MARK: - Catálogo de Reglas Predefinidas

    /// Exige que el campo no esté vacío (ignorando espacios en blanco y saltos de línea).
    public static func notEmpty(
        message: String = "Este campo no puede estar vacío",
        id: String = "notEmpty"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }

    /// Exige una longitud mínima de caracteres.
    public static func minLength(
        min: Int,
        message: String? = nil,
        id: String = "minLength"
    ) -> InputRestriction {
        let msg = message ?? "Debe tener al menos \(min) caracteres"
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.count >= min
        }
    }

    /// Exige una longitud máxima de caracteres.
    public static func maxLength(
        max: Int,
        message: String? = nil,
        id: String = "maxLength"
    ) -> InputRestriction {
        let msg = message ?? "No puede tener más de \(max) caracteres"
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.count <= max
        }
    }

    /// Exige al menos una letra mayúscula.
    public static func hasUppercase(
        message: String = "Debe contener al menos una letra mayúscula",
        id: String = "hasUppercase"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            text.contains(where: { $0.isUppercase })
        }
    }

    /// Exige al menos una letra minúscula.
    public static func hasLowercase(
        message: String = "Debe contener al menos una letra minúscula",
        id: String = "hasLowercase"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            text.contains(where: { $0.isLowercase })
        }
    }

    /// Exige al menos un dígito numérico.
    public static func hasDigit(
        message: String = "Debe contener al menos un número",
        id: String = "hasDigit"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            text.contains(where: { $0.isNumber })
        }
    }

    /// Exige al menos un carácter especial (no alfanumérico ni espacio).
    public static func hasSpecialChar(
        message: String = "Debe contener al menos un carácter especial",
        id: String = "hasSpecialChar"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            text.contains(where: { !$0.isLetter && !$0.isNumber && !$0.isWhitespace })
        }
    }

    /// Exige que el contenido esté compuesto únicamente por dígitos numéricos.
    public static func onlyDigits(
        message: String = "Solo debe contener dígitos",
        id: String = "onlyDigits"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            !text.isEmpty && text.allSatisfy { $0.isNumber }
        }
    }

    /// Valida que el texto tenga un formato de correo electrónico estándar.
    public static func email(
        message: String = "Correo electrónico inválido",
        id: String = "email"
    ) -> InputRestriction {
        let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return regex(pattern: pattern, message: message, id: id)
    }

    /// Valida que el texto cumpla con una expresión regular dada.
    public static func regex(
        pattern: String,
        message: String,
        id: String = "regex"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }
            let range = NSRange(location: 0, length: text.utf16.count)
            return regex.firstMatch(in: text, options: [], range: range) != nil
        }
    }

    /// Regla personalizada con cierre o función provista por el consumidor.
    public static func custom(
        id: String,
        message: String,
        validator: @escaping @Sendable (String) -> Bool
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message, validator: validator)
    }
}
