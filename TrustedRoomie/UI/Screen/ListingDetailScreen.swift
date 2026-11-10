//
//  ListingDetailScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de detalle de un alojamiento con fotos, información, reglas, amenidades, lugares cercanos y reseñas.
/// Equivalente en SwiftUI al composable `ListingDetailScreen` de Jetpack Compose.
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
        /*
        BaseScaffold(
            title: "Detalles",
            onBackTap: onBackTap
        ) {
            ContactButton(onContactTap: onContactTap)
        } content: {
            ScrollView(showsIndicators: false) {
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
        }
        */

        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
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

            ContactButton(onContactTap: onContactTap)
        }
    }
}

/// Barra inferior con botón de contacto e información de autenticación.
/// Equivalente en SwiftUI al composable `ContactButton` de Jetpack Compose.
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
        buttonColor: Color = ColorClay,
        onContactTap: (() -> Void)? = nil
    ) {
        self.buttonText = buttonText
        self.helperText = helperText
        self.iconName = iconName
        self.buttonColor = buttonColor
        self.onContactTap = onContactTap
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 6) {
            GreenCTAButton(
                text: buttonText,
                iconName: iconName,
                color: buttonColor
            ) {
                onContactTap?()
            }

            Text(helperText)
                .font(.system(size: 11, weight: .regular))
                .dmSansFont(.regular, size: 11)
                .lineSpacing(16.5 - 11)
                // .foregroundStyle(Color(hex: 0x7A837F))
                .foregroundStyle(Color.roomie.mute)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(Color(hex: 0xF4F2EC))
        .overlay(
            Rectangle()
                .stroke(Color(hex: 0xE6DECE), lineWidth: 1)
        )
    }
}

#Preview {
    NavigationStack {
        ListingDetailScreen()
    }
    .environment(NavigationRouter())
}
