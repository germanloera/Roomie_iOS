//
//  AppBackground.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/19/26.
//
import SwiftUI

struct AppBackground: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content.background {
            if colorScheme == .dark {
                ZStack {
                    // Color.white
                    Color.roomie.paper
                    RoomiePalette.ScreenBgBrushDark
                }
                .ignoresSafeArea()
            } else {
                ZStack {
                    // Color.white
                    Color.roomie.paper
                    RoomiePalette.ScreenBgBrush
                }
                .ignoresSafeArea()
            }
        }
    }
}
