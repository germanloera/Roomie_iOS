//
//  HomeGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

public enum HomeRoute: Hashable, Identifiable {
    case Home(title: String = "")
    case ListingDetails(title: String = "")
    case Messages(title: String = "Andres Vela", subtitle: String = "Habitacion con terraza")
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
            case .Messages(let title, let subtitle):
                MessageScreen().bg().navigationTitle(title).navigationSubtitle(subtitle)
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
