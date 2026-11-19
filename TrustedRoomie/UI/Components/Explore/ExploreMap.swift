//
//  ExploreMap.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Componente de mapa ilustrado con fondo estilizado y bordes redondeados.
/// Equivalente en SwiftUI al composable `Map_old` de Jetpack Compose (`ui.components.explore`).
public struct ExploreMap: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var onNavigate: (() -> Void)?

    public init(onNavigate: (() -> Void)? = nil) {
        self.onNavigate = onNavigate
    }

    public var body: some View {
        Button {
            onNavigate?()
        } label: {
            ZStack {
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
        .buttonStyle(.plain)
        .padding(.vertical, 10)
    }
}

public typealias Map_old = ExploreMap

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ExploreMap()
            .frame(height: 400)
            .padding(.horizontal, 16)
    }
}
