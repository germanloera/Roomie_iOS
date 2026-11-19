//
//  DefaultButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Botón predeterminado reutilizable con soporte para texto, icono y colores configurables.
/// Equivalente en SwiftUI al composable `DefaultButton` de Jetpack Compose (`ui.base`).
public struct DefaultButton: View {
    // @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var icon: Image?
    public var color: Color
    public var textColor: Color
    public var onTap: (() -> Void)?

    public init(
        text: String = "",
        icon: Image? = nil,
        color: Color = Color.roomie.pine,
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
        text: String = "",
        iconName: String,
        color: Color = Color.roomie.pine,
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
        text: String = "",
        systemIcon: String,
        color: Color = Color.roomie.pine,
        textColor: Color = .white,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
        self.color = color
        self.textColor = textColor
        self.onTap = onTap
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
                    Text(text)
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
        .buttonStyle(DefaultButtonStyle())
    }
}

/// Estilo de botón interactivo para `DefaultButton` que provee retroalimentación táctil suave.
public struct DefaultButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

#Preview {
    VStack(spacing: 16) {
        DefaultButton(text: "Continuar")
        DefaultButton(text: "Continuar con Icono", systemIcon: "arrow.right")
        DefaultButton(
            text: "Botón Secundario",
            color: Color.roomie.sand,
            textColor: Color.roomie.ink
        )
        
        DefaultButton(
            text: "Ver listado de la propiedad",
            iconName: "home_icon",
            color: Color.roomie.sand,
            textColor: Color.roomie.pine
        )
    }
    .padding()
}
