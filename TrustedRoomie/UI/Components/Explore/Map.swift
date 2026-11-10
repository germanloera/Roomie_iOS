//
//  Map.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

// MARK: - Map Colors
public extension RoomiePalette {
    static let mapBg = Color(hex: 0xE8EFE9)
    static let mapBorder = Color(hex: 0xD0DDD3)
}

public let ColorMapBg: Color = RoomiePalette.mapBg
public let ColorMapBorder: Color = RoomiePalette.mapBorder

/// Componente de mapa con fondo ilustrado, bordes redondeados y marco temático.
/// Equivalente en SwiftUI al composable `Map` de Jetpack Compose.
public struct Map: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    
    public var onNavigate: (() -> Void)?

    public init(onNavigate: (() -> Void)? = nil) {
        self.onNavigate = onNavigate
    }

    public var body: some View {
        
        Button {
                router?.navigate(to: ListingRoute.ListingDetail(title: ""))
        } label: {
                   
            ZStack {
                // Map background illustration
                Image("ic_map_background")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColorMapBg)
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .stroke(ColorMapBorder, lineWidth: 1)
            )
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        Map()
            .frame(height: 400)
            .padding(.horizontal, 16)
    }
}
