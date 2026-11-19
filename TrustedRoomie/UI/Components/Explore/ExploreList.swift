//
//  ExploreList.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Lista de propiedades recomendadas y barra de búsqueda para la pantalla de exploración.
/// Equivalente en SwiftUI al composable `ExploreList` de Jetpack Compose (`ui.components.explore`).
public struct ExploreList: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var items: [ListingCardItem]
    public var onMapTap: (() -> Void)?
    public var onCardTap: ((ListingCardItem) -> Void)?

    public init(
        items: [ListingCardItem]? = nil,
        onMapTap: (() -> Void)? = nil,
        onCardTap: ((ListingCardItem) -> Void)? = nil
    ) {
        self.items = items ?? (0..<10).map { _ in
            ListingCardItem(
                title: "Cuarto luminoso en la Roma Norte",
                location: "Roma Norte, CDMX",
                price: "$6,500",
                roommateCount: "4 roomies",
                description: "12 m2, baño propio",
                photoName: "listing_placeholder_large"
            )
        }
        self.onMapTap = onMapTap
        self.onCardTap = onCardTap
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Buscador con icono
            InputWithIcon(
                placeHolder: "Buscar habitaciones o zonas...",
                iconName: "outline_search_24"
            )

            // Cabecera: Conteo de habitaciones y botón para ver mapa
            HStack(alignment: .center) {
                Text("\(items.count) habitaciones en la zona")
                    .font(.dmSans(.extraBold, size: 13))
                    .tracking(0.65)
                    .lineSpacing(19.5 - 13)
                    .foregroundStyle(Color.roomie.mute)

                Spacer()

                PublishAdd(
                    text: "Ver mapa",
                    iconName: "ic_explore"
                ) {
                    if let onMapTap {
                        onMapTap()
                    }
                }
            }

            // Lista desplazable con banner de inicio de sesión y tarjetas de habitaciones
            ScrollView {
                LazyVStack(spacing: 10) {
                    // Opción de inicio de sesión
                    SettingOptionItem(
                        title: "Inicia sesión para contactar titulares",
                        subtitle: "Guarda anuncios y agenda visitas confiables",
                        iconName: "lock_white",
                        titleColor: Color.roomie.ink,
                        iconBackground: Color.roomie.pine,
                        iconTint: Color.roomie.pineContainer,
                        rightIcon: Image("outline_chevron_right_24")
                    ) {
                        router?.navigate(to:  OnboardingRoute.Login(title: ""))
                    }

                    // Lista de tarjetas de publicaciones
                    ForEach(items) { item in
                        MapListingCard(item: item) {
                            if let onCardTap {
                                onCardTap(item)
                            } 
                        }
                    }
                }
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ExploreList()
    }
}
