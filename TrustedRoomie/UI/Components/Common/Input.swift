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
    public var lines: Int
    public var onTextChanged: ((String) -> Void)?

    @Binding private var textBinding: String
    @State private var internalText: String = ""
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo (patrón estándar en SwiftUI).
    public init(
        placeHolder: String = "",
        text: Binding<String>,
        lines: Int = 1,
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self.lines = lines
        self._textBinding = text
        self.isExternalBinding = true
        self.onTextChanged = onTextChanged
    }

    /// Inicializador con valor por defecto y callback opcional (equivalente directo a Compose).
    public init(
        placeHolder: String = "",
        text: String = "",
        lines: Int = 1,
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self.lines = lines
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
        ZStack(alignment: .topLeading) {
            if currentTextBinding.wrappedValue.isEmpty {
                Text(placeHolder)
                    .font(.dmSans(.regular, size: 15))
                    .foregroundStyle(Color.roomie.mute)
                    .padding(.top, lines > 1 ? 2 : 0)
            }

            if lines > 1 {
                TextEditor(text: currentTextBinding)
                    .scrollContentBackground(.hidden)
                    .font(.dmSans(.regular, size: 15))
                    .foregroundStyle(Color.roomie.ink)
                    .frame(minHeight: CGFloat(lines * 24))
            } else {
                TextField("", text: currentTextBinding)
                    .textFieldStyle(.plain)
                    .font(.dmSans(.regular, size: 15))
                    .foregroundStyle(Color.roomie.ink)
            }
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

/// Campo de entrada de texto con icono prefijado (InputWithIcon).
/// Equivalente en SwiftUI al composable `InputWithIcon` de Jetpack Compose (`ui.components.common`).
public struct InputWithIcon: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var placeHolder: String
    public var lines: Int
    public var icon: Image
    public var onTextChanged: ((String) -> Void)?

    @Binding private var textBinding: String
    @State private var internalText: String = ""
    private let isExternalBinding: Bool

    public init(
        placeHolder: String = "",
        text: Binding<String>,
        lines: Int = 1,
        icon: Image = Image("outline_search_24"),
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self.lines = lines
        self.icon = icon
        self._textBinding = text
        self.isExternalBinding = true
        self.onTextChanged = onTextChanged
    }

    public init(
        placeHolder: String = "",
        text: String = "",
        lines: Int = 1,
        icon: Image = Image("outline_search_24"),
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self.lines = lines
        self.icon = icon
        self._textBinding = .constant("")
        self.isExternalBinding = false
        self._internalText = State(initialValue: text)
        self.onTextChanged = onTextChanged
    }

    public init(
        placeHolder: String = "",
        text: String = "",
        lines: Int = 1,
        iconName: String,
        onTextChanged: ((String) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self.lines = lines
        self.icon = Image(iconName)
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
        HStack(spacing: 10) {
            icon
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .padding(1)
                .foregroundStyle(Color.roomie.mute)

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
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .glassEffect(.regular.tint(Color.roomie.cardGlass))
        
      /*
        .background(Color.roomie.cardGlass)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.roomie.inputBorder, lineWidth: 1)
        )*/
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
                    print("Texto ingresado: \(newText)")
                }
            )

            InputWithIcon(
                placeHolder: "Buscar habitaciones o zonas...",
                iconName: "outline_search_24"
            )
        }
        .padding()
    }
}
