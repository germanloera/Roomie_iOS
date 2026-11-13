//
//  PublishAmenities.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección de amenidades para el flujo de publicación de alojamiento.
/// Equivalente en SwiftUI al composable `PublishAmenities` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishAmenities: View {
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
                title: "Amenidades",
                placeHolder: "Ej. lavadora, terraza, cocina equipada o bicicletero.",
                items: items,
                onItemsChanged: onItemsChanged
            )
        } else {
            PublishAddSection(
                title: "Amenidades",
                placeHolder: "Ej. lavadora, terraza, cocina equipada o bicicletero.",
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
            PublishAmenities { amenities in
                print("Amenidades actualizadas: \(amenities)")
            }
        }
        .padding()
    }
}
