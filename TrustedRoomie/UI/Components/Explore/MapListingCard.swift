//
//  MapListingCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Tarjeta de anuncio destacada para la vista de mapa y explorador con portada grande e información compacta.
/// Equivalente en SwiftUI al composable `MapListingCard` de Jetpack Compose (`ui.components.explore`).
public struct MapListingCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var item: ListingCardItem
    public var pillText: String
    public var action: (() -> Void)?

    public init(
        item: ListingCardItem,
        pillText: String = "Disponible",
        action: (() -> Void)? = nil
    ) {
        self.item = item
        self.pillText = pillText
        self.action = action
    }

    public var body: some View {
        Button {
            action?()
        } label: {
            BaseCard(padding: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    // ── Cover Image with Top Badges ─────────────────────────
                    ZStack(alignment: .top) {
                        Image(item.photoName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            //.frame(maxHeight: 180)
                            .clipped()

                        HStack {
                            GreenChip(text: pillText)

                            Spacer()

                            Chip(
                                text: item.roommateCount,
                                color: Color.roomie.pineContainer,
                                textColor: Color.roomie.chipGreenText
                            )
                        }
                        .padding(10)
                    }

                    // ── Details Section ─────────────────────────────────────
                    VStack(alignment: .leading, spacing: 4) {
                        // Top row: Price & Location
                        HStack(alignment: .firstTextBaseline) {
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text(item.price)
                                    .font(.dmSans(.extraBold, size: 15))
                                    .foregroundStyle(Color.roomie.pine)

                                Text(" / mes")
                                    .font(.dmSans(.regular, size: 12))
                                    .foregroundStyle(Color.roomie.mute)
                            }

                            Spacer()

                            HStack(spacing: 4) {
                                Image("outline_location_on_24")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(Color.roomie.clay)

                                Text(item.location)
                                    .font(.dmSans(.regular, size: 12))
                                    .lineSpacing(16 - 12)
                                    .foregroundStyle(Color.roomie.mute)
                            }
                        }

                        // Title
                        Text(item.title)
                            .font(.dmSans(.semiBold, size: 15))
                            .lineSpacing(22.5 - 15)
                            .foregroundStyle(Color.roomie.ink)
                            .lineLimit(1)
                            .truncationMode(.tail)

                        // Description / Roommates
                        Text(item.description.isEmpty ? item.roommateCount : item.description)
                            .font(.dmSans(.regular, size: 11))
                            .lineSpacing(16.5 - 11)
                            .foregroundStyle(Color.roomie.mute)
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 10)
                    .padding(.bottom, 12)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        MapListingCard(
            item: ListingCardItem(
                title: "Cuarto luminoso en la Roma Norte",
                location: "Roma Norte, CDMX",
                price: "$6,500",
                roommateCount: "4 roomies",
                description: "12 m2, baño propio",
                photoName: "listing_placeholder_large"
            )
        )
        .padding()
    }
}
