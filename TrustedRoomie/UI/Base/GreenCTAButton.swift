//
//  GreenCTAButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

/// Botón CTA verde con soporte para icono, texto y colores configurables.
/// Equivalente en SwiftUI al composable `GreenCTAButton` de Jetpack Compose (`ui.base`).
public struct GreenCTAButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: LocalizedText
    public var icon: Image?
    public var color: Color
    public var textColor: Color
    public var onTap: (() -> Void)?

    public init(
        text: LocalizedText = "",
        icon: Image? = nil,
        color: Color = ColorPine,
        textColor: Color = .white,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = icon
        self.color = color
        self.textColor = textColor
        self.onTap = onTap
    }

    public init(
        text: LocalizedText = "",
        iconName: String,
        color: Color = ColorPine,
        textColor: Color = .white,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(iconName)
        self.color = color
        self.textColor = textColor
        self.onTap = onTap
    }

    public init(
        text: LocalizedText = "",
        systemIcon: String,
        color: Color = ColorPine,
        textColor: Color = .white,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
        self.color = color
        self.textColor = textColor
        self.onTap = onTap
    }

    
    public init(
        text: String,
        icon: Image? = nil,
        color: Color = ColorPine,
        textColor: Color = .white,
        onTap: (() -> Void)? = nil
    ) {
        self.init(text: LocalizedText(text), icon: icon, color: color, textColor: textColor, onTap: onTap)
    }

    public init(
        text: String,
        iconName: String,
        color: Color = ColorPine,
        textColor: Color = .white,
        onTap: (() -> Void)? = nil
    ) {
        self.init(text: LocalizedText(text), iconName: iconName, color: color, textColor: textColor, onTap: onTap)
    }

    public init(
        text: String,
        systemIcon: String,
        color: Color = ColorPine,
        textColor: Color = .white,
        onTap: (() -> Void)? = nil
    ) {
        self.init(text: LocalizedText(text), systemIcon: systemIcon, color: color, textColor: textColor, onTap: onTap)
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 5) {
                if let icon {
                    icon
                        .renderingMode(.template)
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
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .buttonStyle(GreenCTAButtonStyle())
    }
}

/// Botón CTA rojo de advertencia / emergencia con borde y colores configurables.
/// Equivalente en SwiftUI al composable `RedCTAButton` de Jetpack Compose (`ui.base`).
public struct RedCTAButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: LocalizedText
    public var icon: Image?
    public var color: Color
    public var textColor: Color
    public var onTap: (() -> Void)?

    public init(
        text: LocalizedText = "",
        icon: Image? = nil,
        color: Color = Color.roomie.emergencyContainer,
        textColor: Color = Color.roomie.emergencyText,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = icon
        self.color = color
        self.textColor = textColor
        self.onTap = onTap
    }

    public init(
        text: LocalizedText = "",
        iconName: String,
        color: Color = Color.roomie.emergencyContainer,
        textColor: Color = Color.roomie.emergencyText,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(iconName)
        self.color = color
        self.textColor = textColor
        self.onTap = onTap
    }

    public init(
        text: LocalizedText = "",
        systemIcon: String,
        color: Color = Color.roomie.emergencyContainer,
        textColor: Color = Color.roomie.emergencyText,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
        self.color = color
        self.textColor = textColor
        self.onTap = onTap
    }

    
    public init(
        text: String,
        icon: Image? = nil,
        color: Color = Color.roomie.emergencyContainer,
        textColor: Color = Color.roomie.emergencyText,
        onTap: (() -> Void)? = nil
    ) {
        self.init(text: LocalizedText(text), icon: icon, color: color, textColor: textColor, onTap: onTap)
    }

    public init(
        text: String,
        iconName: String,
        color: Color = Color.roomie.emergencyContainer,
        textColor: Color = Color.roomie.emergencyText,
        onTap: (() -> Void)? = nil
    ) {
        self.init(text: LocalizedText(text), iconName: iconName, color: color, textColor: textColor, onTap: onTap)
    }

    public init(
        text: String,
        systemIcon: String,
        color: Color = Color.roomie.emergencyContainer,
        textColor: Color = Color.roomie.emergencyText,
        onTap: (() -> Void)? = nil
    ) {
        self.init(text: LocalizedText(text), systemIcon: systemIcon, color: color, textColor: textColor, onTap: onTap)
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 5) {
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
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(textColor, lineWidth: 1)
            )
            .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .buttonStyle(GreenCTAButtonStyle())
    }
}

/// Estilo de botón interactivo para el CTA que provee retroalimentación táctil suave.
public struct GreenCTAButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

#Preview {
    VStack(spacing: 20) {
        GreenCTAButton(text: "Continuar")
        GreenCTAButton(text: "Continuar con Icono", systemIcon: "arrow.right")
        RedCTAButton(text: "Contactar Emergencia", systemIcon: "phone.fill")
    }
    .padding()
}
