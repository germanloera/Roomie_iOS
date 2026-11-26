//
//  InputWithLabel.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente que combina una etiqueta superior y un campo `Input` reutilizable con soporte para validación, formatos y contraseña.
public struct InputWithLabel: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var label: String
    public var placeHolder: String
    public var lines: Int
    public var isSecure: Bool
    public var format: InputFormat
    public var restrictions: [InputRestriction]
    public var forceShowError: Bool
    public var onTextChanged: ((String) -> Void)?
    public var onValidationChanged: ((_ isValid: Bool, _ failedRestrictions: [InputRestriction]) -> Void)?

    @Binding private var textBinding: String
    @State private var internalText: String = ""
    private let isExternalBinding: Bool

    // MARK: - Initializers

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        label: String = "",
        placeHolder: String = "",
        lines: Int = 1,
        text: Binding<String>,
        isSecure: Bool = false,
        format: InputFormat = .none,
        restrictions: [InputRestriction] = [],
        forceShowError: Bool = false,
        onTextChanged: ((String) -> Void)? = nil,
        onValidationChanged: ((_ isValid: Bool, _ failedRestrictions: [InputRestriction]) -> Void)? = nil
    ) {
        self.label = label
        self.placeHolder = placeHolder
        self.lines = lines
        self.isSecure = isSecure
        self.format = format
        self.restrictions = restrictions
        self.forceShowError = forceShowError
        self._textBinding = text
        self.isExternalBinding = true
        self.onTextChanged = onTextChanged
        self.onValidationChanged = onValidationChanged
    }

    /// Inicializador simplificado con Binding sin callback (retrocompatibilidad).
    public init(
        label: String = "",
        placeHolder: String = "",
        lines: Int = 1,
        text: Binding<String>
    ) {
        self.init(
            label: label,
            placeHolder: placeHolder,
            lines: lines,
            text: text,
            isSecure: false,
            format: .none,
            restrictions: [],
            forceShowError: false,
            onTextChanged: nil,
            onValidationChanged: nil
        )
    }

    /// Inicializador con valor por defecto y callback opcional.
    public init(
        label: String = "",
        placeHolder: String = "",
        lines: Int = 1,
        text: String = "",
        isSecure: Bool = false,
        format: InputFormat = .none,
        restrictions: [InputRestriction] = [],
        forceShowError: Bool = false,
        onTextChanged: ((String) -> Void)? = nil,
        onValidationChanged: ((_ isValid: Bool, _ failedRestrictions: [InputRestriction]) -> Void)? = nil
    ) {
        self.label = label
        self.placeHolder = placeHolder
        self.lines = lines
        self.isSecure = isSecure
        self.format = format
        self.restrictions = restrictions
        self.forceShowError = forceShowError
        self._textBinding = .constant("")
        self.isExternalBinding = false
        self._internalText = State(initialValue: text)
        self.onTextChanged = onTextChanged
        self.onValidationChanged = onValidationChanged
    }

    /// Inicializador directo con closure sin texto inicial explícito.
    public init(
        label: String = "",
        placeHolder: String = "",
        lines: Int = 1,
        isSecure: Bool = false,
        format: InputFormat = .none,
        restrictions: [InputRestriction] = [],
        forceShowError: Bool = false,
        onTextChanged: ((String) -> Void)? = nil,
        onValidationChanged: ((_ isValid: Bool, _ failedRestrictions: [InputRestriction]) -> Void)? = nil
    ) {
        self.init(
            label: label,
            placeHolder: placeHolder,
            lines: lines,
            text: "",
            isSecure: isSecure,
            format: format,
            restrictions: restrictions,
            forceShowError: forceShowError,
            onTextChanged: onTextChanged,
            onValidationChanged: onValidationChanged
        )
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !label.isEmpty {
                Text(label)
                    .font(.dmSans(.semiBold, size: 12))
                    .lineSpacing(4) // 16sp lineHeight - 12sp fontSize
                    .foregroundStyle(Color.roomie.mute)
            }

            if isExternalBinding {
                Input(
                    placeHolder: placeHolder,
                    text: $textBinding,
                    lines: lines,
                    isSecure: isSecure,
                    format: format,
                    restrictions: restrictions,
                    forceShowError: forceShowError,
                    onTextChanged: onTextChanged,
                    onValidationChanged: onValidationChanged
                )
            } else {
                Input(
                    placeHolder: placeHolder,
                    text: internalText,
                    lines: lines,
                    isSecure: isSecure,
                    format: format,
                    restrictions: restrictions,
                    forceShowError: forceShowError,
                    onTextChanged: { newText in
                        internalText = newText
                        onTextChanged?(newText)
                    },
                    onValidationChanged: onValidationChanged
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Previews

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ScrollView {
            VStack(spacing: 20) {
                InputWithLabel(
                    label: "Correo electrónico",
                    placeHolder: "ejemplo@correo.com",
                    restrictions: [.email()],
                    onTextChanged: { value in
                        print("Email: \(value)")
                    }
                )

                InputWithLabel(
                    label: "Contraseña",
                    placeHolder: "Ingresa tu contraseña",
                    isSecure: true,
                    restrictions: [.minLength(min: 8), .hasUppercase(), .hasDigit()]
                )

                InputWithLabel(
                    label: "Teléfono de contacto",
                    placeHolder: "(###) ### ####",
                    format: .phone(),
                    restrictions: [.minLength(min: 10, message: "Debe incluir 10 dígitos")]
                )

                InputWithLabel(
                    label: "Presupuesto máximo",
                    placeHolder: "Monto en MXN",
                    format: .currency(symbol: "$")
                )

                InputWithLabel(
                    label: "Descripción personal",
                    placeHolder: "Escribe un mensaje...",
                    lines: 4
                )
            }
            .padding()
        }
    }
}
