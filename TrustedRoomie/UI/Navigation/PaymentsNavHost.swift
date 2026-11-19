//
//  PaymentsNavHost.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

public extension PaymentsDestination {
    static var PAYMENTS: PaymentsDestination { .services }
    static var INCIDENTS: PaymentsDestination { .incidents }

    var route: String {
        switch self {
        case .services: return "payment"
        case .incidents: return "issues"
        }
    }
}

/// NavHost secundario para alternar entre Servicios/Pagos e Incidentes.
/// Equivalente en SwiftUI a `PaymentsNavHost` de Jetpack Compose (`ui.navigation`).
public struct PaymentsNavHost: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var destination: PaymentsDestination

    public init(destination: Binding<PaymentsDestination>) {
        self._destination = destination
    }

    public init(destination: PaymentsDestination = .services) {
        self._destination = .constant(destination)
    }

    public var body: some View {
        Group {
            switch destination {
            case .services:
                PaymentsServicesTab()
            case .incidents:
                PaymentsIncidents()
            }
        }
    }
}
