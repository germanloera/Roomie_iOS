//
//  BaseGreenCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente de tarjeta verde base con elevación, bordes redondeados y fondo verde `PinePrimaryLight`.
/// Equivalente en SwiftUI al composable `BaseGreenCard` de Jetpack Compose.
public struct BaseGreenCard<Content: View>: View {
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
        .background(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(PinePrimaryLight)
                .shadow(color: Color.black.opacity(0.08), radius: 2, x: 0, y: 1)
        )
        .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}

public extension BaseGreenCard where Content == EmptyView {
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
            BaseGreenCard {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Título en tarjeta verde")
                        .font(.headline)
                        .foregroundStyle(.white)

                    Text("Contenido de prueba dentro de BaseGreenCard.")
                        .font(.subheadline)
                        .foregroundStyle(Color.white.opacity(0.8))
                }
            }

            BaseGreenCard(padding: 24, cornerRadius: 16) {
                Text("Tarjeta verde con configuración personalizada")
                    .font(.body)
                    .foregroundStyle(.white)
            }
        }
        .padding()
    }
}
