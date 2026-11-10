//
//  BeigeButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Botón beige secundario con fondo blanco translúcido (alpha 0.55) y bordes redondeados.
/// Equivalente en SwiftUI al composable `BeigeButton` de Jetpack Compose.
public struct BeigeButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var onTap: (() -> Void)?

    public init(
        text: String = "",
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            Text(text)
                .font(.system(size: 15, weight: .semibold))
                .dmSansFont(.semiBold, size: 15)
                .lineSpacing(22.5 - 15)
                // .foregroundStyle(Color.black)
                .foregroundStyle(Color.roomie.ink)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(Color.white.opacity(0.55))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .buttonStyle(BeigeButtonStyle())
    }
}

/// Estilo de botón interactivo para el BeigeButton con respuesta táctil.
public struct BeigeButtonStyle: ButtonStyle {
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
            BeigeButton(text: "Crea tu cuenta") {
                print("Tapped Crea tu cuenta")
            }
        }
        .padding()
    }
}
