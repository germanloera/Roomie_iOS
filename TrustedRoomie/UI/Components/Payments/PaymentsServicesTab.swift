//
//  PaymentsServicesTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pestaña o listado que muestra la lista de pagos de servicios y renta.
/// Equivalente en SwiftUI al composable `PaymentsServicesTab` de Jetpack Compose (`ui.components.payments`).
public struct PaymentsServicesTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public init() {}

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 10) {
                PaymentPaymentsItem()
                PaymentPaymentsItem()
                PaymentPaymentsItem()
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

        PaymentsServicesTab()
            .padding(.horizontal)
    }
}
