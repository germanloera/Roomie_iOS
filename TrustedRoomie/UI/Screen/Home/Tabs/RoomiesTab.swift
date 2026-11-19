//
//  RoomiesTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pestaña que lista los compañeros del piso (roomies), solicitudes de salida e historial de inquilinos.
/// Equivalente en SwiftUI al composable `RoomiesTab` de Jetpack Compose (`ui.screen.home.tabs`).
@MainActor
public struct RoomiesTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public init() {}

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Encabezado
            VStack(alignment: .leading, spacing: 0) {
                Text("Roomies")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

                Text("Roma Norte · 4 integrantes")
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.mute)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
            .padding(.bottom, 12)

            // Contenido scrolleable
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    LeavingRequestNotification()

                    RoomieSectionHeader(text: "Integrantes")

                    ForEach(0..<4, id: \.self) { _ in
                        RoomieListItem()
                    }

                    RoomieSectionHeader(text: "Historial de inquilinos")

                    ForEach(0..<2, id: \.self) { _ in
                        RoomieListItem()
                    }
                }
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        RoomiesTab()
            .environment(NavigationRouter())
    }
}
