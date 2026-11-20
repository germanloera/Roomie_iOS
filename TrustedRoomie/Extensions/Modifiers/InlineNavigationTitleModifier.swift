//
//  InlineNavigationTitleModifier.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/19/26.
//
import SwiftUI

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
