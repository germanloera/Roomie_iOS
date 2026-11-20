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
    case ProfilePublishPlace(title: String = "Publicar anuncio", subtitle: String = "Los cambios se reflejan al momento")
    case LeaveRequest(title: String = "Solicitar salida")
    case RateRoomie(title: String = "Dejar reseña", subtitle: String = "Reseña del inquilino")
    case SendInvite(title: String = "Enviar invitación", subtitle: String = "Confirma los acuerdos antes de enviarla")

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
                HomeScreen()//.bg() 
            case .ListingDetails:
                ListingDetailScreen().screenSetup(config: ScreenConfig(title: "Details"))
            case .Messages(let title, let subtitle):
                MessageScreen().screenSetup(config: ScreenConfig(title: title, subtitle: subtitle))
            case .ProfilePublishPlace(let title, let subtitle):
                ListingCreateEditScreen().screenSetup(config: ScreenConfig(title: title, subtitle: subtitle))
            case .LeaveRequest(let title):
                LeaveRequest().screenSetup(config: ScreenConfig(title: title))
            case .RateRoomie(let title, let subtitle):
                RateRoomie().screenSetup(config: ScreenConfig(title: title, subtitle: subtitle))
            case .SendInvite(let title, let subtitle):
                SendInvite().screenSetup(config: ScreenConfig(title: title, subtitle: subtitle))
            }
        }
    }
}
