//
//  FormattedText.swift
//  TrustedRoomie
//
//  Created by Antigravity on 11/26/26.
//

import SwiftUI

/// Componente de texto reutilizable en SwiftUI que aplica formateo automático
/// sobre cadenas de texto o valores numéricos según un `InputFormat`.
public struct FormattedText: View {
    public let text: String
    public let format: InputFormat
    public let placeholder: String

    // MARK: - Initializers

    /// Inicializador con argumento etiquetado `text`.
    public init(
        text: String,
        format: InputFormat = .none,
        placeholder: String = ""
    ) {
        self.text = text
        self.format = format
        self.placeholder = placeholder
    }

    /// Inicializador directo posicional (ej. `FormattedText("1234567890", format: .phone())`).
    public init(
        _ text: String,
        format: InputFormat = .none,
        placeholder: String = ""
    ) {
        self.text = text
        self.format = format
        self.placeholder = placeholder
    }

    /// Inicializador conveniente para cadenas opcionales.
    public init(
        text: String?,
        format: InputFormat = .none,
        placeholder: String = ""
    ) {
        self.text = text ?? ""
        self.format = format
        self.placeholder = placeholder
    }

    /// Inicializador para números enteros.
    public init<T: BinaryInteger>(
        value: T,
        format: InputFormat = .number(),
        placeholder: String = ""
    ) {
        self.text = String(value)
        self.format = format
        self.placeholder = placeholder
    }

    /// Inicializador para números de punto flotante.
    public init<T: BinaryFloatingPoint>(
        value: T,
        format: InputFormat = .currency(),
        placeholder: String = ""
    ) {
        self.text = String(describing: value)
        self.format = format
        self.placeholder = placeholder
    }

    // MARK: - Computed Properties

    /// Contenido visual transformado tras sanitizar y aplicar la máscara/formato.
    public var formattedText: String {
        guard !text.isEmpty else {
            return placeholder
        }
        let result = format.format(text: text)
        return result.isEmpty ? placeholder : result
    }

    // MARK: - Body

    public var body: some View {
        Text(formattedText)
    }
}

// MARK: - Previews

#Preview("FormattedText Examples") {
    VStack(alignment: .leading, spacing: 20) {
        // Texto plano (.none)
        VStack(alignment: .leading, spacing: 4) {
            Text("Plano (.none):")
                .font(.caption)
                .foregroundStyle(.secondary)
            FormattedText(text: "Hola TrustedRoomie", format: .none)
                .font(.body)
        }

        // Teléfono (.phone)
        VStack(alignment: .leading, spacing: 4) {
            Text("Teléfono (.phone):")
                .font(.caption)
                .foregroundStyle(.secondary)
            FormattedText(text: "5512345678", format: .phone())
                .font(.subheadline)
                .foregroundStyle(Color.roomie.ink)
        }

        // Número (.number)
        VStack(alignment: .leading, spacing: 4) {
            Text("Número (.number):")
                .font(.caption)
                .foregroundStyle(.secondary)
            FormattedText(text: "111111111.11", format: .number(allowDecimals: true, maxDecimals: 2))
                .font(.body)
        }

        // Moneda (.currency)
        VStack(alignment: .leading, spacing: 4) {
            Text("Moneda (.currency):")
                .font(.caption)
                .foregroundStyle(.secondary)
            FormattedText(text: "15500.5", format: .currency(symbol: "$", maxDecimals: 2))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.roomie.pine)
        }

        // Máscara personalizada (.customMask)
        VStack(alignment: .leading, spacing: 4) {
            Text("Máscara personalizada (.customMask):")
                .font(.caption)
                .foregroundStyle(.secondary)
            FormattedText(text: "ABC1234XYZ", format: .customMask(mask: "###-####-###"))
                .font(.headline)
        }
    }
    .padding()
}
