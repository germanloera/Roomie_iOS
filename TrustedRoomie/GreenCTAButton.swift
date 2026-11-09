//
//  GreenCTAButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

/// Botón CTA verde con soporte para icono y texto personalizado.
/// Equivalente en SwiftUI al composable `GreenCTAButton` de Jetpack Compose.
public struct GreenCTAButton: View {
    public var text: String
    public var icon: Image?
    public var color: Color
    public var onTap: (() -> Void)?

    public init(
        text: String = "",
        icon: Image? = nil,
        color: Color = ColorPine,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = icon
        self.color = color
        self.onTap = onTap
    }

    public init(
        text: String = "",
        iconName: String,
        color: Color = ColorPine,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(iconName)
        self.color = color
        self.onTap = onTap
    }

    public init(
        text: String = "",
        systemIcon: String,
        color: Color = ColorPine,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
        self.color = color
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 5) {
                if let icon {
                    icon
                }
                if !text.isEmpty {
                    Text(text)
                        .font(.system(size: 15, weight: .semibold))
                        .lineSpacing(22.5 - 15)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
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
    }
    .padding()
}
