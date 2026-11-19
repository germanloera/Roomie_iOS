//
//  ExploreNavHost.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Destinos o subpestañas de navegación para el módulo de Exploración.
/// Equivalente en SwiftUI a `ExploreDestination` de Jetpack Compose (`ui.navigation`).
public enum ExploreDestination: String, CaseIterable, Identifiable, Sendable {
    case MAP = "map"
    case LIST = "list"

    public var id: String { rawValue }

    public var route: String { rawValue }

    public var label: String {
        switch self {
        case .MAP: return "map"
        case .LIST: return "lista"
        }
    }

    // Alias lowercase para compatibilidad Swift
    public static var map: ExploreDestination { .MAP }
    public static var list: ExploreDestination { .LIST }
}

/// NavHost secundario para alternar entre el mapa interactivo y la lista de habitaciones.
/// Equivalente en SwiftUI a `ExploreNavHost` de Jetpack Compose (`ui.navigation`).
public struct ExploreNavHost: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var destination: ExploreDestination

    public init(destination: Binding<ExploreDestination>) {
        self._destination = destination
    }

    public var body: some View {
        Group {
            switch destination {
            case .MAP:
                MapView(
                    /*onListTap: {
                        destination = .LIST
                    }*/
                )
            case .LIST:
                ExploreList(
                    onMapTap: {
                        destination = .MAP
                    }
                )
            }
        }
    }
}
