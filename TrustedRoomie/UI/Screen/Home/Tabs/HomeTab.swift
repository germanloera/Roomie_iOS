//
//  HomeTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pestaña principal de Inicio del titular/inquilino con resumen de piso, invitaciones, incidencias, pagos, tareas y eventos.
/// Equivalente en SwiftUI al composable `HomeTab` de Jetpack Compose (`ui.screen.home.tabs`).
@MainActor
public struct HomeTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?


    public var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    HomeGreenHeaderCard()

                    RoomieSectionHeader(text: "Interesados e invitaciones")

                    ForEach(0..<2, id: \.self) { _ in
                        RoomieListItem()
                    }

                    RoomieSectionHeader(text: "Incidentes", rightText: "Ver todos") {
                        // Navegación o filtro a incidentes
                    }

                    ForEach(0..<2, id: \.self) { _ in
                        PaymentIncidentItem(showDescription: false)
                    }

                    RoomieSectionHeader(text: "Pagos pendientes", rightText: "Ver todos") {
                        // Navegación o filtro a pagos
                    }

                    ForEach(0..<2, id: \.self) { _ in
                        PaymentPaymentsItem(showUserDetail: false)
                    }

                    RoomieSectionHeader(text: "Tareas del piso", rightText: "Ver todas") {
                        // Navegación o filtro a tareas
                    }

                    ForEach(0..<2, id: \.self) { _ in
                        TaskItem(readOnly: true)
                    }

                    RoomieSectionHeader(text: "Próximos eventos")

                    ForEach(0..<2, id: \.self) { _ in
                        EventItem(readOnly: true)
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

        // HomeTab()
        //   .environment(NavigationRouter())
    }
}
