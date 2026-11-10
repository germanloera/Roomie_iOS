//
//  InputWithLabel.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente que combina una etiqueta superior y un campo `Input` reutilizable.
/// Equivalente en SwiftUI al composable `InputWithLabel` de Jetpack Compose.
public struct InputWithLabel: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var label: String
    public var placeHolder: String
    public var onTextChanged: ((String) -> Void)?

    @Binding private var textBinding: String
    @State private var internalText: String = ""
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        label: String = "",
        placeHolder: String = "",
        text: Binding<String>,
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.label = label
        self.placeHolder = placeHolder
        self._textBinding = text
        self.isExternalBinding = true
        self.onTextChanged = onTextChanged
    }

    /// Inicializador con valor por defecto y callback opcional (equivalente directo a Compose).
    public init(
        label: String = "",
        placeHolder: String = "",
        text: String = "",
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.label = label
        self.placeHolder = placeHolder
        self._textBinding = .constant("")
        self.isExternalBinding = false
        self._internalText = State(initialValue: text)
        self.onTextChanged = onTextChanged
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !label.isEmpty {
                Text(label)
                    .font(.system(size: 12, weight: .semibold))
                    .dmSansFont(.semiBold, size: 12)
                    .lineSpacing(4) // 16sp lineHeight - 12sp fontSize
                    .foregroundStyle(Color.roomie.mute)
            }

            if isExternalBinding {
                Input(
                    placeHolder: placeHolder,
                    text: $textBinding,
                    onTextChanged: onTextChanged
                )
            } else {
                Input(
                    placeHolder: placeHolder,
                    text: internalText,
                    onTextChanged: { newText in
                        internalText = newText
                        onTextChanged?(newText)
                    }
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            InputWithLabel(
                label: "Correo electrónico",
                placeHolder: "ejemplo@correo.com",
                onTextChanged: { value in
                    print("Email: \(value)")
                }
            )

            InputWithLabel(
                label: "Nombre completo",
                placeHolder: "Ingresa tu nombre",
                text: "German Loera"
            )
        }
        .padding()
    }
}
