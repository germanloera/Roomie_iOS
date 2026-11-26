//
//  Input.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI
import UIKit

/// Componente de campo de texto personalizado con soporte para contraseñas, validación, restricciones y formateo en vivo.
public struct Input: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    @FocusState private var isFieldFocused: Bool

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

    @State private var displayFormattedText: String = ""
    @State private var isPasswordRevealed: Bool = false
    @State private var hasInteracted: Bool = false
    @State private var failedRestrictions: [InputRestriction] = []

    // MARK: - Initializers

    /// Inicializador principal con Binding directo (patrón estándar en SwiftUI).
    public init(
        placeHolder: String = "",
        text: Binding<String>,
        lines: Int = 1,
        isSecure: Bool = false,
        format: InputFormat = .none,
        restrictions: [InputRestriction] = [],
        forceShowError: Bool = false,
        onTextChanged: ((String) -> Void)? = nil,
        onValidationChanged: ((_ isValid: Bool, _ failedRestrictions: [InputRestriction]) -> Void)? = nil
    ) {
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

    /// Inicializador con valor por defecto y callback opcional.
    public init(
        placeHolder: String = "",
        text: String = "",
        lines: Int = 1,
        isSecure: Bool = false,
        format: InputFormat = .none,
        restrictions: [InputRestriction] = [],
        forceShowError: Bool = false,
        onTextChanged: ((String) -> Void)? = nil,
        onValidationChanged: ((_ isValid: Bool, _ failedRestrictions: [InputRestriction]) -> Void)? = nil
    ) {
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

    // MARK: - Computed Properties

    private var currentRawText: String {
        get {
            isExternalBinding ? textBinding : internalText
        }
    }

    private var shouldShowError: Bool {
        guard !failedRestrictions.isEmpty else { return false }
        if forceShowError { return true }
        if hasInteracted { return true }
        return !currentRawText.isEmpty
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                ZStack(alignment: .topLeading) {
                    if displayFormattedText.isEmpty {
                        Text(placeHolder)
                            .font(.dmSans(.regular, size: 15))
                            .foregroundStyle(Color.roomie.mute)
                            .padding(.top, lines > 1 ? 2 : 0)
                            .allowsHitTesting(false)
                    }

                    if lines > 1 {
                        TextEditor(text: formattedTextBinding)
                            .scrollContentBackground(.hidden)
                            .font(.dmSans(.regular, size: 15))
                            .foregroundStyle(Color.roomie.ink)
                            .frame(minHeight: CGFloat(lines * 24))
                            .focused($isFieldFocused)
                    } else if isSecure && !isPasswordRevealed {
                        SecureField("", text: formattedTextBinding)
                            .textFieldStyle(.plain)
                            .font(.dmSans(.regular, size: 15))
                            .foregroundStyle(Color.roomie.ink)
                            .textContentType(.password)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .focused($isFieldFocused)
                    } else {
                        TextField("", text: formattedTextBinding)
                            .textFieldStyle(.plain)
                            .font(.dmSans(.regular, size: 15))
                            .foregroundStyle(Color.roomie.ink)
                            .keyboardType(isSecure ? .default : format.keyboardType)
                            .autocorrectionDisabled(isSecure)
                            .textInputAutocapitalization(isSecure ? .never : (format == .none ? .sentences : .never))
                            .focused($isFieldFocused)
                    }
                }

                if isSecure {
                    Button {
                        let wasFocused = isFieldFocused
                        isPasswordRevealed.toggle()
                        if wasFocused {
                            DispatchQueue.main.async {
                                isFieldFocused = true
                            }
                        }
                    } label: {
                        Image(systemName: isPasswordRevealed ? "eye.slash" : "eye")
                            .font(.system(size: 18))
                            .foregroundStyle(Color.roomie.mute)
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.roomie.inputBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(shouldShowError ? Color.roomie.error : Color.roomie.inputBorder, lineWidth: shouldShowError ? 1.5 : 1)
            )

            if shouldShowError, let firstError = failedRestrictions.first {
                Text(firstError.errorMessage)
                    .font(.dmSans(.regular, size: 12))
                    .foregroundStyle(Color.roomie.error)
                    .padding(.horizontal, 4)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.easeInOut(duration: 0.2), value: shouldShowError)
        .onAppear {
            initializeContent()
        }
        .onChange(of: isExternalBinding ? textBinding : internalText) { _, newRaw in
            handleExternalRawChange(newRaw)
        }
        .onChange(of: isFieldFocused) { _, isFocused in
            if !isFocused {
                hasInteracted = true
            }
        }
    }

    // MARK: - Text Binding Adapter

    private var formattedTextBinding: Binding<String> {
        Binding(
            get: { displayFormattedText },
            set: { newDisplay in
                hasInteracted = true
                let sanitizedRaw = format.sanitizeToRaw(newDisplay)
                let properlyFormatted = format.format(rawText: sanitizedRaw)

                displayFormattedText = properlyFormatted
                updateRawText(sanitizedRaw)
                runValidation(for: sanitizedRaw)
            }
        )
    }

    // MARK: - Validation & State Updates

    private func initializeContent() {
        let raw = currentRawText
        displayFormattedText = format.format(rawText: raw)
        runValidation(for: raw)
    }

    private func handleExternalRawChange(_ newRaw: String) {
        let currentSanitizedDisplay = format.sanitizeToRaw(displayFormattedText)
        if currentSanitizedDisplay != newRaw {
            displayFormattedText = format.format(rawText: newRaw)
        }
        runValidation(for: newRaw)
    }

    private func updateRawText(_ newRaw: String) {
        if isExternalBinding {
            textBinding = newRaw
        } else {
            internalText = newRaw
        }
        onTextChanged?(newRaw)
    }

    private func runValidation(for raw: String) {
        let failed = restrictions.filter { !$0.validator(raw) }
        failedRestrictions = failed
        let isValid = failed.isEmpty
        onValidationChanged?(isValid, failed)
    }
}

// MARK: - InputWithIcon

/// Campo de entrada de texto con icono prefijado (InputWithIcon).
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
        .background(Color.roomie.inputBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.roomie.inputBorder, lineWidth: 1)
        )
    }
}

// MARK: - Previews

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ScrollView {
            VStack(spacing: 20) {
                // Input Básico
                Input(
                    placeHolder: "Ingresa tu nombre",
                    restrictions: [.notEmpty()]
                )

                // Input Contraseña con Toggle y Validaciones
                Input(
                    placeHolder: "Contraseña segura",
                    isSecure: true,
                    restrictions: [
                        .minLength(min: 8),
                        .hasUppercase(),
                        .hasDigit(),
                        .hasSpecialChar()
                    ]
                )

                // Input Teléfono con Máscara en Vivo
                Input(
                    placeHolder: "Teléfono",
                    format: .phone(),
                    restrictions: [
                        .minLength(min: 10, message: "Debe incluir los 10 dígitos")
                    ]
                )

                // Input Moneda
                Input(
                    placeHolder: "Precio o Renta mensual",
                    format: .currency(symbol: "$"),
                    restrictions: [.notEmpty()]
                )

                InputWithIcon(
                    placeHolder: "Buscar habitaciones o zonas...",
                    iconName: "outline_search_24"
                )
            }
            .padding()
        }
    }
}
