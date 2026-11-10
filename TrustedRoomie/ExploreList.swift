//
//  ExploreList.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Lista de propiedades recomendadas para la pantalla de exploración.
/// Equivalente en SwiftUI al composable `ExploreList` de Jetpack Compose.
public struct ExploreList: View {
    public var items: [ListingCardItem]

    public init(items: [ListingCardItem]? = nil) {
        self.items = items ?? [
            ListingCardItem(
                title: "Cuarto luminoso en la Roma Norte",
                location: "Roma Norte, CDMX",
                price: "$6,500",
                roommateCount: "4 roomies"
            ),
            ListingCardItem(
                title: "Cuarto luminoso en la Roma Norte",
                location: "Roma Norte, CDMX",
                price: "$6,500",
                roommateCount: "4 roomies"
            ),
            ListingCardItem(
                title: "Cuarto luminoso en la Roma Norte",
                location: "Roma Norte, CDMX",
                price: "$6,500",
                roommateCount: "4 roomies"
            )
        ]
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(items) { item in
                ExploreListingCard(item: item) {
                    // navigate.to(AppDestinations.ListingDetails)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(.vertical, 10)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ScrollView {
            ExploreList()
                .padding(.horizontal, 16)
        }
    }
}
