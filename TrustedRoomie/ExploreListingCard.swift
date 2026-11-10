//
//  ExploreListingCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Modelo de datos para la tarjeta de listado en la pantalla de exploración.
public struct ListingCardItem: Identifiable, Hashable, Sendable {
    public var id: String
    public var title: String
    public var location: String
    public var price: String
    public var roommateCount: String
    public var isAvailable: Bool
    public var photoName: String

    public init(
        id: String = UUID().uuidString,
        title: String,
        location: String,
        price: String,
        roommateCount: String,
        isAvailable: Bool = true,
        photoName: String = "listing_place_holder"
    ) {
        self.id = id
        self.title = title
        self.location = location
        self.price = price
        self.roommateCount = roommateCount
        self.isAvailable = isAvailable
        self.photoName = photoName
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
    public var item: ListingCardItem
    public var action: (() -> Void)?

    public init(
        item: ListingCardItem,
        action: (() -> Void)? = nil
    ) {
        self.item = item
        self.action = action
    }

    public var body: some View {
        BaseCard {
            HStack(alignment: .center, spacing: 12) {
                // ── Photo thumbnail ──────────────────────────────────────────
                ZStack {
                    Color.roomie.cardGlass

                    Image(item.photoName)
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 96, height: 96)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                // ── Info column ─────────────────────────────────────────────
                VStack(alignment: .leading, spacing: 4) {
                    // Row: Chip + roommate count
                    HStack(alignment: .center) {
                        Chip(
                            text: item.isAvailable ? "Disponible" : "Ocupado",
                            color: item.isAvailable ? Color.roomie.pineContainer : Color.roomie.clayContainer,
                            textColor: item.isAvailable ? Color.roomie.onPineContainer : Color.roomie.onClayContainer
                        )

                        Spacer(minLength: 4)

                        Text(item.roommateCount)
                            .font(.system(size: 11, weight: .regular))
                            .dmSansFont(.regular, size: 11)
                            .lineSpacing(5.5) // 16.5sp lineHeight - 11sp fontSize
                            .foregroundStyle(Color.roomie.mute)
                    }

                    // Property title — 1 line with ellipsis
                    Text(item.title)
                        .font(.system(size: 15, weight: .semibold))
                        .dmSansFont(.semiBold, size: 15)
                        .lineSpacing(7.5) // 22.5sp lineHeight - 15sp fontSize
                        .foregroundStyle(Color.roomie.ink)
                        .lineLimit(1)
                        .truncationMode(.tail)

                    // Location
                    Text(item.location)
                        .font(.system(size: 12, weight: .regular))
                        .dmSansFont(.regular, size: 12)
                        .lineSpacing(4) // 16sp lineHeight - 12sp fontSize
                        .foregroundStyle(Color.roomie.mute)
                        .lineLimit(1)

                    // Price: bold pine + muted "/ mes"
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(item.price)
                            .font(.system(size: 15, weight: .bold))
                            .dmSansFont(.semiBold, size: 15)
                            .foregroundStyle(Color.roomie.pine)

                        Text(" / mes")
                            .font(.system(size: 12, weight: .regular))
                            .dmSansFont(.regular, size: 12)
                            .foregroundStyle(Color.roomie.mute)
                    }
                    .lineSpacing(7.5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .contentShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .onTapGesture {
            action?()
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ExploreListingCard(
                item: ListingCardItem(
                    title: "Habitación luminosa en Roma Norte",
                    location: "Cuauhtémoc, Ciudad de México",
                    price: "$6,500",
                    roommateCount: "4 roomies",
                    isAvailable: true,
                    photoName: "listing_place_holder"
                ),
                action: {
                    print("Card tapped!")
                }
            )

            ExploreListingCard(
                item: ListingCardItem(
                    title: "Departamento compartido Condesa",
                    location: "Condesa, Ciudad de México",
                    price: "$8,200",
                    roommateCount: "2 roomies",
                    isAvailable: false,
                    photoName: "listing_place_holder"
                )
            )
        }
        .padding()
    }
}
