//
//  PaymentsIncidents.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pestaña o listado que muestra la lista de incidencias registradas en la vivienda.
/// Equivalente en SwiftUI al composable `PaymentsIncidents` de Jetpack Compose (`ui.components.payments`).
public struct PaymentsIncidents: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public init() {}

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 10) {
                PaymentIncidentItem()
                PaymentIncidentItem()
                PaymentIncidentItem()
                PaymentIncidentItem()
                PaymentIncidentItem()
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PaymentsIncidents()
            .padding(.horizontal)
    }
}
