//
//  HomeGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Representa las rutas de navegación del módulo principal (Home) y flujos asociados.
/// Equivalente en SwiftUI a `homeGraph` de Jetpack Compose (`ui.navigation.graph`).
public enum HomeRoute: Hashable, Identifiable {
    case Home(title: String = "")
    case ListingDetails(title: String = "")
    case Messages(title: String = "")
    case ProfilePublishPlace(title: String = "")
    case LeaveRequest(title: String = "")
    case RateRoomie(title: String = "")
    case SendInvite(title: String = "")

    public var id: String {
        switch self {
        case .Home:
            return "Home"
        case .ListingDetails:
            return "ListingDetails"
        case .Messages:
            return "Messages"
        case .ProfilePublishPlace:
            return "ProfilePublishPlace"
        case .LeaveRequest:
            return "LeaveRequest"
        case .RateRoomie:
            return "RateRoomie"
        case .SendInvite:
            return "SendInvite"
        }
    }
}

public extension View {
    /// Grafo de navegación para las pantallas del módulo Home y flujos de detalles/mensajes.
    func HomeGraph() -> some View {
        navigationDestination(for: HomeRoute.self) { route in
            switch route {
            case .Home:
                HomeScreen().bg()
            case .ListingDetails:
                ListingDetailScreen().bg()
            case .Messages:
                MessageScreen().bg()
            case .ProfilePublishPlace:
                ListingCreateEditScreen().bg()
            case .LeaveRequest:
                LeaveRequest().bg()
            case .RateRoomie:
                RateRoomie().bg()
            case .SendInvite:
                SendInvite().bg()
            }
        }
    }
}
