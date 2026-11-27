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
    public var id: Int = -1

    public init(id: Int = -1) {
        self.id = id
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HomeTabHeader(id: id)

            // Contenido scrolleable
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    LeavingRequestNotification()

                    RoomieSectionHeader(text: "roomies.section.members")

                    ForEach(0..<4, id: \.self) { _ in
                        RoomieListItem()
                    }

                    RoomieSectionHeader(text: "roomies.section.history")

                    ForEach(0..<2, id: \.self) { _ in
                        RoomieListItem()
                    }
                }
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
        
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
