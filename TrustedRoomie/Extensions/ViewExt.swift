//
//  ViewExt.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI






extension View{
    
    func bg() -> some View{
        modifier(AppBackground())
        
        
    }
    
    func title(
          _ title: String,
          font: Font = .fraunces(.semiBold ,size: 24),
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
                
            }else{
                
                ZStack {
                    Color.white
                    RoomiePalette.ScreenBgBrush
                }
                .ignoresSafeArea()
            }
        }
    }
}
