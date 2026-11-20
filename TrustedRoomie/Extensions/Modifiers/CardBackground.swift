//
//  CardBackground.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/19/26.
//
import SwiftUI

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
                    // .shadow(color: hasShadow ? Color.black.opacity(0.08) : .clear, radius: 2, x: 0, y: 1)
                    .shadow(color: hasShadow ? Color.roomie.ink.opacity(0.08) : .clear, radius: 2, x: 0, y: 1)
            )
        } else {
            content.background(gradient)
        }
    }
}
