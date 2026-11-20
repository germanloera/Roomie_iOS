//
//  ListingCreateEditScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla para crear o editar la publicación de un alojamiento.
/// Equivalente en SwiftUI al composable `ListingCreateEditScreen` de Jetpack Compose (`ui.screen.listing`).
@MainActor
public struct ListingCreateEditScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var onPublishTap: (() -> Void)?
    public var onDeleteTap: (() -> Void)?

    public init(
        onPublishTap: (() -> Void)? = nil,
        onDeleteTap: (() -> Void)? = nil
    ) {
        self.onPublishTap = onPublishTap
        self.onDeleteTap = onDeleteTap
    }

    public var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    PublishPhotoItems()
                    PublishListingInfo()
                    PublishCurrentAddress()
                    PublishSharedServices()
                    PublishRules()
                    PublishAmenities()
                    PublishNearbyPlaces()
                    HideListingItem()

                    BaseSimpleButton(
                        text: "Eliminar este anuncio",
                        textColor: Color.roomie.destructive,
                        borderColor: Color.roomie.destructive
                    ) {
                        if let onDeleteTap {
                            onDeleteTap()
                        } else {
                            // Presenta el BottomSheet de confirmación de eliminación según paridad
                            router?.presentBottomSheet(
                                .deleteListing(
                                    listingTitle: "Cuarto luminoso en la Roma Norte",
                                    onDelete: {
                                        router?.dismissBottomSheet()
                                        router?.pop()
                                    },
                                    onCancel: {
                                        router?.dismissBottomSheet()
                                    }
                                )
                            )
                        }
                    }
                    .padding(.vertical, 10)
                }
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)

            PublishButton(action: onPublishTap)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
        }
    }
}

#Preview {
    ListingCreateEditScreen()
        .environment(NavigationRouter())
}
