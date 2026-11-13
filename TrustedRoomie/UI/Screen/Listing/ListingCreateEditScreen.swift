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

    public init(onPublishTap: (() -> Void)? = nil) {
        self.onPublishTap = onPublishTap
    }

    public var body: some View {
        BaseScaffold(
            title: "Publica tu lugar",
            subtitle: "Al publicar te convertirás en titular",
            bottomBar: {
                PublishButton(action: onPublishTap)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
            }
        ) {
            ScrollView {
                LazyVStack(spacing: 8) {
                    PublishPhotoItems()
                    PublishListingInfo()
                    PublishCurrentAddress()
                    PublishSharedServices()
                    PublishRules()
                    PublishAmenities()
                    PublishNearbyPlaces()
                }
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
    }
}

/// Barra inferior con botón alternativo para contacto / inicio de sesión en publicaciones.
/// Equivalente en SwiftUI al composable `PublishPlaceButton` de Jetpack Compose (`ui.screen.listing`).
public struct PublishPlaceButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var onContactTap: (() -> Void)?

    public init(onContactTap: (() -> Void)? = nil) {
        self.onContactTap = onContactTap
    }

    public var body: some View {
        VStack(spacing: 0) {
            Divider()
                .background(Color.roomie.cardBorder)

            VStack(alignment: .center, spacing: 0) {
                GreenCTAButton(
                    text: "Inicia sesión para contactar",
                    iconName: "lock_white",
                    color: Color.roomie.clay
                ) {
                    if let onContactTap {
                        onContactTap()
                    } else {
                        router?.navigate(to: OnboardingRoute.Login(title: "Iniciar Sesión"))
                    }
                }
                .frame(maxWidth: .infinity)

                Text("Crea tu cuenta para chatear con el titular")
                    .font(.dmSans(.regular, size: 11))
                    .lineSpacing(16.5 - 11)
                    .foregroundStyle(Color.roomie.mute)
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 12)
            .background(Color.roomie.paper)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ListingCreateEditScreen()
        .environment(NavigationRouter())
}
