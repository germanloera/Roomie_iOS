//
//  BaseCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente de tarjeta base con elevación, bordes redondeados y gradiente de fondo.
/// Equivalente en SwiftUI al composable `BaseCard` de Jetpack Compose.
public struct BaseCard<Content: View>: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var padding: CGFloat
    public var cornerRadius: CGFloat
    public var content: Content?

    public init(
        padding: CGFloat = 16,
        cornerRadius: CGFloat = 24,
        @ViewBuilder content: () -> Content
    ) {
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let content {
                content
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(padding)
        .cardFill(cornerRadius: cornerRadius, hasShadow: true)
        .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}

public extension BaseCard where Content == EmptyView {
    init(
        padding: CGFloat = 16,
        cornerRadius: CGFloat = 24
    ) {
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.content = nil
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            BaseCard {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Título de la Tarjeta")
                        .roomieFont(.headlineLarge)
                        .foregroundStyle(Color.roomie.ink)

                    Text("Este es el contenido de prueba dentro del componente BaseCard traducido desde Compose.")
                        .roomieFont(.bodyMedium)
                        .foregroundStyle(Color.roomie.mute)
                }
            }

            BaseCard(padding: 24, cornerRadius: 16) {
                Text("Tarjeta con padding y radio personalizados")
                    .roomieFont(.bodyLarge)
                    .foregroundStyle(Color.roomie.ink)
            }
        }
        .padding()
    }
}
