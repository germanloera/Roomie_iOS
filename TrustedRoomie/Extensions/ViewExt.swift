//
//  ViewExt.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI


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



extension View{
    
    func bg() -> some View{
        modifier(AppBackground())
        
        
    }
    
}
