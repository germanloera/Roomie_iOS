//
//  ProfileCurrentAddress.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección que muestra la dirección o alojamiento actual del usuario en su perfil con acceso a ver los detalles.
/// Equivalente en SwiftUI al composable `ProfileCurrentAddress` de Jetpack Compose (`ui.components.profile`).
public struct ProfileCurrentAddress: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var address: String
    public var zone: String
    public var buttonText: String
    public var onSeeListingTap: (() -> Void)?

    public init(
        title: String = "Vive actualmente",
        address: String = "Orizaba 140, Roma Norte, Cuauhtémoc, CDMX",
        zone: String = "Roma Norte, CDMX",
        buttonText: String = "Ver listado de la propiedad",
        onSeeListingTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.address = address
        self.zone = zone
        self.buttonText = buttonText
        self.onSeeListingTap = onSeeListingTap
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.dmSans(.extraBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            BaseCard {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top, spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color.roomie.pineContainer)
                                .frame(width: 40, height: 40)

                            Image("outline_location_on_24")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.roomie.pine)
                        }
                        .frame(width: 40, height: 40)

                        VStack(alignment: .leading, spacing: 2) {
                            Text(address)
                                .font(.dmSans(.semiBold, size: 14))
                                .lineSpacing(20 - 14)
                                .foregroundStyle(Color.roomie.ink)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text(zone)
                                .font(.dmSans(.regular, size: 12))
                                .lineSpacing(16 - 12)
                                .foregroundStyle(Color.roomie.mute)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    DefaultButton(
                        text: buttonText,
                        iconName: "home_icon",
                        color: Color.roomie.sand,
                        textColor: Color.roomie.pine
                    ) {
                        if let onSeeListingTap {
                            onSeeListingTap()
                        } else {
                            router?.navigate(to: AppDestination.ListingDetails())
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ProfileCurrentAddress()
        }
        .padding()
    }
}
