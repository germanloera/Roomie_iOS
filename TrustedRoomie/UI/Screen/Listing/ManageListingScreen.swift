//
//  ManageListingScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pantalla para gestionar los anuncios y publicaciones de alojamiento del titular.
/// Equivalente en SwiftUI al composable `ManageListingScreen` de Jetpack Compose (`ui.screen.listing`).
@MainActor
public struct ManageListingScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var subtitle: String
    public var descriptionText: String
    public var listingItem: ListingCardItem
    public var onBackTap: (() -> Void)?
    public var onListingTap: (() -> Void)?
    public var onCreateListingTap: (() -> Void)?

    public init(
        title: String = "Mis anuncios",
        subtitle: String = "1 anuncio publicado",
        descriptionText: String = "Crea y ajusta la información que ven los usuarios al explorar habitaciones.",
        listingItem: ListingCardItem = ListingCardItem(
            title: "Cuarto luminoso en la Roma Norte",
            location: "Roma Norte, CDMX",
            price: "$6,500",
            roommateCount: ""
        ),
        onBackTap: (() -> Void)? = nil,
        onListingTap: (() -> Void)? = nil,
        onCreateListingTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.descriptionText = descriptionText
        self.listingItem = listingItem
        self.onBackTap = onBackTap
        self.onListingTap = onListingTap
        self.onCreateListingTap = onCreateListingTap
    }

    public var body: some View {
        BaseScaffold(
            title: title,
            subtitle: subtitle,
            onBackTap: onBackTap
        ) {
            ScrollView {
                LazyVStack(alignment: .center, spacing: 8) {
                    Text(descriptionText)
                        .font(.dmSans(.regular, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.mute)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ExploreListingCard(
                        item: listingItem,
                        pillText: "Visible"
                    ) {
                        if let onListingTap {
                            onListingTap()
                        } else {
                            router?.navigate(to: ListingRoute.ListingDetail(title: listingItem.title))
                            // router?.navigate(to: AppDestinations.ListingDetails) // Estructura según Regla 5
                        }
                    }

                    BaseSimpleButton(
                        text: "Crear otro anuncio",
                        borderColor: Color.roomie.sand,
                        iconName: "outline_add_24"
                    ) {
                        if let onCreateListingTap {
                            onCreateListingTap()
                        } else {
                            router?.navigate(to: ListingRoute.ListingPublish(title: ""))
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ManageListingScreen()
        .environment(NavigationRouter())
}
