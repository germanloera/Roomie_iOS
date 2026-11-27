//
//  BaseSimpleButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Botón simple con borde, fondo, icono opcional y texto configurable.
/// Equivalente en SwiftUI al composable `BaseSimpleButton` de Jetpack Compose (`ui.components.common`).
public struct BaseSimpleButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: LocalizedText
    public var textColor: Color
    public var borderColor: Color
    public var background: Color
    public var icon: Image?
    public var onTap: (() -> Void)?

    public init(
        text: LocalizedText = "",
        textColor: Color = Color.roomie.pine,
        borderColor: Color = Color.roomie.inputBorder,
        background: Color = Color.roomie.inputBackground,
        icon: Image? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.textColor = textColor
        self.borderColor = borderColor
        self.background = background
        self.icon = icon
        self.onTap = onTap
    }

    public init(
        text: LocalizedText = "",
        textColor: Color = Color.roomie.pine,
        borderColor: Color = Color.roomie.inputBorder,
        background: Color = Color.roomie.inputBackground,
        iconName: String,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.textColor = textColor
        self.borderColor = borderColor
        self.background = background
        self.icon = Image(iconName)
        self.onTap = onTap
    }

    public init(
        text: LocalizedText = "",
        textColor: Color = Color.roomie.pine,
        borderColor: Color = Color.roomie.inputBorder,
        background: Color = Color.roomie.inputBackground,
        systemIcon: String,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.textColor = textColor
        self.borderColor = borderColor
        self.background = background
        self.icon = Image(systemName: systemIcon)
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 8) {
                if let icon {
                    icon
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17, height: 17)
                        .padding(1)
                        .foregroundStyle(textColor)
                }

                if !text.isEmpty {
                    text.text
                        .font(.dmSans(.semiBold, size: 15))
                        .lineSpacing(22.5 - 15)
                        .foregroundStyle(textColor)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(borderColor, lineWidth: 1)
            )
            .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .buttonStyle(BaseSimpleButtonStyle())
    }
}

/// Estilo de botón interactivo para `BaseSimpleButton` con respuesta táctil.
public struct BaseSimpleButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.75 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            BaseSimpleButton(text: "Cancelar")
            BaseSimpleButton(
                text: "Filtrar resultados",
                textColor: Color.roomie.clay,
                borderColor: Color.roomie.clay.opacity(0.4),
                background: Color.roomie.cardGlass
            )
        }
        .padding()
    }
}
