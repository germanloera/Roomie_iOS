//
//  ListingDetailScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de detalle de un alojamiento con fotos, información, reglas, amenidades, lugares cercanos y reseñas.
/// Equivalente en SwiftUI al composable `ListingDetailScreen` de Jetpack Compose (`ui.screen.listing`).
@MainActor
public struct ListingDetailScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var onBackTap: (() -> Void)?
    public var onContactTap: (() -> Void)?

    public init(
        onBackTap: (() -> Void)? = nil,
        onContactTap: (() -> Void)? = nil
    ) {
        self.onBackTap = onBackTap
        self.onContactTap = onContactTap
    }

    public var body: some View {
        VStack() {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ListingPhotoSection()
                    ListingInfoSection()
                    ListingGreenCard()
                    ListingLocationSection()
                    ListingMonthlyPaymentCard()
                    ListingRulesCard()
                    ListingAmenitiesCard()
                    ListingClosePlacesCard()
                    ListingPlaceReviews()
                }
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)

            ContactButton(onContactTap: onContactTap)
        }
    }
}

/// Barra inferior con botón de contacto e información de autenticación.
/// Equivalente en SwiftUI al composable `ContactButton` de Jetpack Compose (`ui.screen.listing`).
public struct ContactButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var buttonText: String
    public var helperText: String
    public var iconName: String
    public var buttonColor: Color
    public var onContactTap: (() -> Void)?

    public init(
        buttonText: String = "Inicia sesión para contactar",
        helperText: String = "Crea tu cuenta para chatear con el titular",
        iconName: String = "lock_white",
        buttonColor: Color = Color.roomie.clay,
        onContactTap: (() -> Void)? = nil
    ) {
        self.buttonText = buttonText
        self.helperText = helperText
        self.iconName = iconName
        self.buttonColor = buttonColor
        self.onContactTap = onContactTap
    }

    public var body: some View {
        VStack(spacing: 0) {
            Divider()
                .background(Color.roomie.line)

            VStack(alignment: .center, spacing: 4) {
                GreenCTAButton(
                    text: buttonText,
                    iconName: iconName,
                    color: buttonColor
                ) {
                    if let onContactTap {
                        onContactTap()
                    } else {
                        router?.navigate(to: OnboardingRoute.Login)
                    }
                }
                .frame(maxWidth: .infinity)

                Text(helperText)
                    .font(.dmSans(.regular, size: 11))
                    .lineSpacing(16.5 - 11)
                    .foregroundStyle(Color.roomie.mute)
                    .multilineTextAlignment(.center)
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
    NavigationStack {
        ListingDetailScreen()
    }
    .environment(NavigationRouter())
}
