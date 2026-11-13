//
//  Input.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente de campo de texto personalizado con borde, fondo semitransparente y placeholder configurable.
/// Equivalente en SwiftUI al composable `Input` de Jetpack Compose (`ui.components.common`).
public struct Input: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var placeHolder: String
    public var onTextChanged: ((String) -> Void)?

    @Binding private var textBinding: String
    @State private var internalText: String = ""
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo (patrón estándar en SwiftUI).
    public init(
        placeHolder: String = "",
        text: Binding<String>,
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self._textBinding = text
        self.isExternalBinding = true
        self.onTextChanged = onTextChanged
    }

    /// Inicializador con valor por defecto y callback opcional (equivalente directo a Compose).
    public init(
        placeHolder: String = "",
        text: String = "",
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self._textBinding = .constant("")
        self.isExternalBinding = false
        self._internalText = State(initialValue: text)
        self.onTextChanged = onTextChanged
    }

    private var currentTextBinding: Binding<String> {
        if isExternalBinding {
            return Binding(
                get: { textBinding },
                set: { newValue in
                    textBinding = newValue
                    onTextChanged?(newValue)
                }
            )
        } else {
            return Binding(
                get: { internalText },
                set: { newValue in
                    internalText = newValue
                    onTextChanged?(newValue)
                }
            )
        }
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            if currentTextBinding.wrappedValue.isEmpty {
                Text(placeHolder)
                    .font(.dmSans(.regular, size: 15))
                    .foregroundStyle(Color.roomie.mute)
            }

            TextField("", text: currentTextBinding)
                .textFieldStyle(.plain)
                .font(.dmSans(.regular, size: 15))
                .foregroundStyle(Color.roomie.ink)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.roomie.inputBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.roomie.inputBorder, lineWidth: 1)
        )
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            Input(
                placeHolder: "Ingresa tu correo electrónico",
                onTextChanged: { newText in
                    print("Texto cambiado: \(newText)")
                }
            )

            Input(
                placeHolder: "Nombre completo",
                text: "Juan Pérez"
            )
        }
        .padding()
    }
}
