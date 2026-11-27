//
//  PublishAddText.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Campo de texto individual con botón para eliminar (icono de basura) alojado en `BaseCard`.
/// Equivalente en SwiftUI al composable `PublishAddText` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishAddText: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var placeHolder: String
    public var onTextChanged: ((String) -> Void)?
    public var onTap: (() -> Void)?

    @Binding private var textBinding: String
    @State private var internalText: String = ""
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo (SwiftUI).
    public init(
        text: Binding<String>,
        placeHolder: String = "",
        onTextChanged: ((String) -> Void)? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text.wrappedValue
        self.placeHolder = placeHolder
        self._textBinding = text
        self.isExternalBinding = true
        self.onTextChanged = onTextChanged
        self.onTap = onTap
    }

    /// Inicializador con valor por defecto (Compose).
    public init(
        text: String = "",
        placeHolder: String = "",
        onTextChanged: ((String) -> Void)? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.placeHolder = placeHolder
        self._textBinding = .constant("")
        self.isExternalBinding = false
        self._internalText = State(initialValue: text)
        self.onTextChanged = onTextChanged
        self.onTap = onTap
    }

    private var currentBinding: Binding<String> {
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
        BaseCard(padding: 4) {
            HStack(spacing: 5) {
                Input(
                    placeHolder: placeHolder,
                    text: currentBinding
                )
                .frame(maxWidth: .infinity)

                Button {
                    onTap?()
                } label: {
                    Image(systemName: "trash")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(Color.roomie.pine)
                        .frame(width: 17, height: 17)
                        .padding(1)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel(Text("common.delete"))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

/// Campo doble (concepto y monto con prefijo "$") con botón para eliminar en `BaseCard`.
/// Equivalente en SwiftUI al composable `PublishAddMultipleText` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishAddMultipleText: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var amount: String
    public var onTextChanged: ((String) -> Void)?
    public var onAmountChanged: ((String) -> Void)?
    public var onTap: (() -> Void)?

    @State private var internalText: String = ""
    @State private var internalAmount: String = ""

    public init(
        text: String = "",
        amount: String = "",
        onTextChanged: ((String) -> Void)? = nil,
        onAmountChanged: ((String) -> Void)? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.amount = amount
        self._internalText = State(initialValue: text)
        self._internalAmount = State(initialValue: amount)
        self.onTextChanged = onTextChanged
        self.onAmountChanged = onAmountChanged
        self.onTap = onTap
    }

    public var body: some View {
        BaseCard(padding: 8) {
            HStack(alignment: .center, spacing: 5) {
                VStack(alignment: .leading, spacing: 5) {
                    Input(
                        placeHolder: "Concepto",
                        text: $internalText,
                        onTextChanged: { newValue in
                            onTextChanged?(newValue)
                        }
                    )

                    HStack(spacing: 5) {
                        Text("$")
                            .font(.dmSans(.regular, size: 25))
                            .foregroundStyle(Color.roomie.mute)

                        Input(
                            placeHolder: "0.00",
                            text: $internalAmount,
                            onTextChanged: { newValue in
                                onAmountChanged?(newValue)
                            }
                        )
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)

                Button {
                    onTap?()
                } label: {
                    Image(systemName: "trash")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(Color.roomie.pine)
                        .frame(width: 17, height: 17)
                        .padding(1)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel(Text("common.delete"))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            PublishAddText(
                text: "Servicio de limpieza incluido",
                onTap: {
                    print("Eliminar presionado")
                }
            )

            PublishAddMultipleText(
                text: "Renta mensual",
                amount: "5500",
                onTap: {
                    print("Eliminar multiple presionado")
                }
            )
        }
        .padding()
    }
}
