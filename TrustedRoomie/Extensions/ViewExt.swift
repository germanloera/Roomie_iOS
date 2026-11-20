//
//  ViewExt.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

public extension View {
    
    func  screenSetup(config : ScreenConfig ) -> some View{
        self.title(config: config)
            .screenFrame()
            .bg()
    }


    func screenFrame() -> some View{
        self.frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .top)
            .padding(.horizontal, 20)
    }
    
    func title(config : ScreenConfig ) -> some View{
        modifier(TitleModifier(config: config))
    }
    
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
    

    /// Aplica un borde punteado/discontinuo con esquinas redondeadas.
    /// Equivalente en SwiftUI a `Modifier.dashedBorder(...)` de Jetpack Compose.
    func dashedBorder(
        color: Color,
        cornerRadius: CGFloat = 16,
        lineWidth: CGFloat = 1,
        dash: [CGFloat] = [4, 4]
    ) -> some View {
        overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                .foregroundStyle(color)
        )
    }
}




