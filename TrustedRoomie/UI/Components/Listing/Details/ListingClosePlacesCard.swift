//
//  ListingClosePlacesCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Tarjeta que muestra la lista de lugares cercanos o puntos de interés del alojamiento.
/// Equivalente en SwiftUI al composable `ListingClosePlacesCard` de Jetpack Compose (`ui.components.listing.details`).
public struct ListingClosePlacesCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var label: String
    public var places: [String]

    public static let defaultPlaces: [String] = [
        "Cocina equipada",
        "Lavadora",
        "Terraza común",
        "Bicicletero"
    ]

    public init(
        label: String = "Amenidades",
        places: [String] = defaultPlaces
    ) {
        self.label = label
        self.places = places
    }

    public var body: some View {
        BaseListingCardSection(label: label) {
            VStack(spacing: 0) {
                ForEach(Array(places.enumerated()), id: \.offset) { _, place in
                    ListingPlaceItem(item: place)
                }
            }
        }
    }
}

/// Elemento individual que representa un lugar o punto de interés con icono de ubicación y texto descriptivo.
/// Equivalente en SwiftUI al composable `ListingPlaceItem` de Jetpack Compose (`ui.components.listing.details`).
public struct ListingPlaceItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var item: String

    public init(item: String = "") {
        self.item = item
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 10) {
                Image("outline_location_on_24")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .padding(1)
                    .frame(width: 16, height: 16)
                    .foregroundStyle(Color.roomie.clay)

                Text(item)
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

public typealias ListingClosePlacesCardSeccion = ListingClosePlacesCard
public typealias ListingClosePlacesCardSection = ListingClosePlacesCard

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ListingClosePlacesCard()
        }
        .padding()
    }
}
