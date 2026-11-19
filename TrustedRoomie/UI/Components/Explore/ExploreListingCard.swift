//
//  ExploreListingCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Modelo de datos para la tarjeta de listado en la pantalla de exploración y mapas.
/// Equivalente en SwiftUI a `ListingCardItem` de Jetpack Compose (`ui.components.explore`).
public struct ListingCardItem: Identifiable, Hashable, Sendable {
    public var id: String
    public var title: String
    public var location: String
    public var price: String
    public var roommateCount: String
    public var description: String
    public var isAvailable: Bool
    public var photoName: String

    public init(
        id: String = UUID().uuidString,
        title: String,
        location: String,
        price: String,
        roommateCount: String,
        description: String = "",
        photoName: String = "listing_place_holder",
        isAvailable: Bool = true
    ) {
        self.id = id
        self.title = title
        self.location = location
        self.price = price
        self.roommateCount = roommateCount
        self.description = description
        self.photoName = photoName
        self.isAvailable = isAvailable
    }
}

/**
 * Explore listing card as designed in Figma (node 1:63).
 *
 * Layout:
 *  ┌────────────────────────────────────────┐
 *  │  [Photo 96×96]  Disponible  4 roomies  │
 *  │                 Title (1 line)         │
 *  │                 Location               │
 *  │                 $6,500 / mes           │
 *  └────────────────────────────────────────┘
 */
public struct ExploreListingCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var item: ListingCardItem
    public var hideAvailability: Bool
    public var pillText: String
    public var action: (() -> Void)?

    public init(
        item: ListingCardItem,
        hideAvailability: Bool = false,
        pillText: String = "Disponible",
        action: (() -> Void)? = nil
    ) {
        self.item = item
        self.hideAvailability = hideAvailability
        self.pillText = pillText
        self.action = action
    }

    public var body: some View {
        Button {
            action?()
        } label: {
            BaseCard {
                HStack(alignment: .center, spacing: 12) {
                    // ── Photo thumbnail ──────────────────────────────────
                    ZStack {
                        Color.roomie.cardGlass

                        Image(item.photoName)
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 96, height: 96)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                    // ── Info column ─────────────────────────────────────
                    VStack(alignment: .leading, spacing: 4) {
                        if !hideAvailability {
                            HStack(alignment: .center) {
                                GreenChip(text: pillText)

                                Spacer(minLength: 4)

                                Text(item.roommateCount)
                                    .font(.dmSans(.regular, size: 11))
                                    .lineSpacing(16.5 - 11)
                                    .foregroundStyle(Color.roomie.mute)
                            }
                        }

                        // Property title — 1 line with ellipsis
                        Text(item.title)
                            .font(.dmSans(.semiBold, size: 15))
                            .lineSpacing(22.5 - 15)
                            .foregroundStyle(Color.roomie.ink)
                            .lineLimit(1)
                            .truncationMode(.tail)

                        // Location
                        Text(item.location)
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                            .lineLimit(1)

                        // Price: bold pine + muted "/ mes"
                        HStack(alignment: .firstTextBaseline, spacing: 2) {
                            Text(item.price)
                                .font(.dmSans(.extraBold, size: 15))
                                .foregroundStyle(Color.roomie.pine)

                            Text(" / mes")
                                .font(.dmSans(.regular, size: 12))
                                .foregroundStyle(Color.roomie.mute)
                        }
                        .lineSpacing(22.5 - 15)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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

        VStack(spacing: 16) {
            ExploreListingCard(
                item: ListingCardItem(
                    title: "Cuarto luminoso en la Roma Norte",
                    location: "Roma Norte, CDMX",
                    price: "$6,500",
                    roommateCount: "4 roomies"
                )
            )

            ExploreListingCard(
                item: ListingCardItem(
                    title: "Habitación en depa con terraza",
                    location: "Condesa, CDMX",
                    price: "$7,200",
                    roommateCount: "3 roomies"
                ),
                hideAvailability: true
            )
        }
        .padding()
    }
}
