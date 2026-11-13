//
//  PublishNearbyPlaces.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección de lugares cercanos para el flujo de publicación de alojamiento.
/// Equivalente en SwiftUI al composable `PublishNearbyPlaces` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishNearbyPlaces: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var items: Binding<[String]>?
    public var onItemsChanged: (([String]) -> Void)?

    public init(
        items: Binding<[String]>? = nil,
        onItemsChanged: (([String]) -> Void)? = nil
    ) {
        self.items = items
        self.onItemsChanged = onItemsChanged
    }

    public var body: some View {
        if let items {
            PublishAddSection(
                title: "Lugares Cercanos",
                placeHolder: "Ej. gimnasio, escuela, supermercado, metro o parque.",
                items: items,
                onItemsChanged: onItemsChanged
            )
        } else {
            PublishAddSection(
                title: "Lugares Cercanos",
                placeHolder: "Ej. gimnasio, escuela, supermercado, metro o parque.",
                onItemsChanged: onItemsChanged
            )
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            PublishNearbyPlaces { places in
                print("Lugares cercanos: \(places)")
            }
        }
        .padding()
    }
}
