//
//  ListingAmenitiesCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Tarjeta que muestra la lista de amenidades del alojamiento.
/// Equivalente en SwiftUI al composable `ListingAmenitiesCard` de Jetpack Compose.
public struct ListingAmenitiesCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var label: String
    public var amenities: [String]

    public static let defaultAmenities: [String] = [
        "Cocina equipada",
        "Lavadora",
        "Terraza común",
        "Bicicletero"
    ]

    public init(
        label: String = "Amenidades",
        amenities: [String] = defaultAmenities
    ) {
        self.label = label
        self.amenities = amenities
    }

    public var body: some View {
        BaseListingCardSection(label: label) {
            VStack(spacing: 0) {
                ForEach(Array(amenities.enumerated()), id: \.offset) { _, item in
                    ListingRuleItem(item: item)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ListingAmenitiesCard()
        }
        .padding()
    }
}
