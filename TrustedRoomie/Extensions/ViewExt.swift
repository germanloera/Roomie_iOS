//
//  ViewExt.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

public extension View {
    func bg() -> some View {
        modifier(AppBackground())
    }
    
    /// Aplica el fondo adaptativo de tarjeta (Light/Dark mode) al componente donde se llame.
    func cardFill(cornerRadius: CGFloat? = nil, hasShadow: Bool = false) -> some View {
        modifier(CardBackground(cornerRadius: cornerRadius, hasShadow: hasShadow))
    }

    /// Alias de `cardFill` para aplicar el fondo adaptativo de tarjeta al componente.
    func cardBackground(cornerRadius: CGFloat? = nil, hasShadow: Bool = false) -> some View {
        modifier(CardBackground(cornerRadius: cornerRadius, hasShadow: hasShadow))
    }
    
    func title(
        _ title: String,
        font: Font = .fraunces(.semiBold, size: 24),
        color: Color = .white
    ) -> some View {
        self.modifier(InlineNavigationTitleModifier(title: title, font: font, color: color))
    }
}

// 1. Creamos el ViewModifier personalizado
struct InlineNavigationTitleModifier: ViewModifier {
    let title: String
    let font: Font
    let color: Color

    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(font)
                        .foregroundColor(color)
                }
            }
    }
}

struct AppBackground: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content.background {
            if colorScheme == .dark {
                ZStack {
                    Color.white
                    RoomiePalette.ScreenBgBrushDark
                }
                .ignoresSafeArea()
            } else {
                ZStack {
                    Color.white
                    RoomiePalette.ScreenBgBrush
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct CardBackground: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    var cornerRadius: CGFloat?
    var hasShadow: Bool = false

    func body(content: Content) -> some View {
        let gradient = colorScheme == .dark
            ? RoomiePalette.cardDarkContainerGradient
            : RoomiePalette.cardContainerGradient

        if let cornerRadius {
            content.background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(gradient)
                    .shadow(color: hasShadow ? Color.black.opacity(0.08) : .clear, radius: 2, x: 0, y: 1)
            )
        } else {
            content.background(gradient)
        }
    }
}
