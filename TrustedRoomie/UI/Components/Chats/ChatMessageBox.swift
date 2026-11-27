//
//  ChatMessageBox.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Barra inferior de entrada de texto y botón de envío para la conversación de chat.
/// Equivalente en SwiftUI al composable `ChatMessageBox` de Jetpack Compose (`ui.components.chats`).
public struct ChatMessageBox: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var placeholder: LocalizedText
    public var onSend: ((String) -> Void)?
    public var onTextChanged: ((String) -> Void)?

    @Binding private var bindingText: String
    @State private var internalText: String = ""
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo al texto ingresado.
    public init(
        placeholder: LocalizedText = "chats.input_placeholder",
        text: Binding<String>,
        onTextChanged: ((String) -> Void)? = nil,
        onSend: ((String) -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self._bindingText = text
        self.isExternalBinding = true
        self.onTextChanged = onTextChanged
        self.onSend = onSend
    }

    /// Inicializador con valor por defecto y callbacks opcionales (equivalente directo a Compose).
    public init(
        placeholder: LocalizedText = "chats.input_placeholder",
        text: String = "",
        onTextChanged: ((String) -> Void)? = nil,
        onSend: ((String) -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self._bindingText = .constant("")
        self.isExternalBinding = false
        self._internalText = State(initialValue: text)
        self.onTextChanged = onTextChanged
        self.onSend = onSend
    }

    
    public init(
        placeholder: String,
        text: Binding<String>,
        onTextChanged: ((String) -> Void)? = nil,
        onSend: ((String) -> Void)? = nil
    ) {
        self.init(
            placeholder: LocalizedText(placeholder),
            text: text,
            onTextChanged: onTextChanged,
            onSend: onSend
        )
    }

    public init(
        placeholder: String,
        text: String = "",
        onTextChanged: ((String) -> Void)? = nil,
        onSend: ((String) -> Void)? = nil
    ) {
        self.init(
            placeholder: LocalizedText(placeholder),
            text: text,
            onTextChanged: onTextChanged,
            onSend: onSend
        )
    }

    private var currentTextBinding: Binding<String> {
        if isExternalBinding {
            return Binding(
                get: { bindingText },
                set: { newValue in
                    bindingText = newValue
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

    private func handleSend() {
        let trimmed = currentTextBinding.wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        onSend?(trimmed)
        currentTextBinding.wrappedValue = ""
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Input(
                placeHolder: placeholder,
                text: currentTextBinding,
                onTextChanged: onTextChanged
            )
            .frame(maxWidth: .infinity)

            Button {
                handleSend()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.roomie.warn)
                        .frame(width: 40, height: 40)

                    if UIImage(named: "send") != nil {
                        Image("send")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color.white)
                    } else {
                        Image(systemName: "paperplane.fill")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color.white)
                    }
                }
                .frame(width: 40, height: 40)
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 5)
        .padding(.trailing, 5)
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            Spacer()
            ChatMessageBox { sentText in
                print("Mensaje enviado: \(sentText)")
            }
        }
    }
}
