//
//  ListingGreenCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Tarjeta verde que muestra el monto de la aportación mensual y la cantidad de ocupantes en el piso.
/// Equivalente en SwiftUI al composable `ListingGreenCard` de Jetpack Compose (`ui.components.listing.details`).
public struct ListingGreenCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var monthlyContributionTitle: String
    public var price: String
    public var occupantsInfo: String

    public init(
        monthlyContributionTitle: String = "Tu aportación mensual",
        price: String = "$6,500",
        occupantsInfo: String = "4 personas\nen el piso"
    ) {
        self.monthlyContributionTitle = monthlyContributionTitle
        self.price = price
        self.occupantsInfo = occupantsInfo
    }

    public var body: some View {
        BaseGreenCard {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(monthlyContributionTitle)
                        .font(.dmSans(.regular, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.white)

                    Text(price)
                        .font(.fraunces(.regular, size: 30))
                        .lineSpacing(36 - 30)
                        .foregroundStyle(Color.white)
                }

                Spacer()

                Text(occupantsInfo)
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.trailing)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ListingGreenCard()

            ListingGreenCard(
                monthlyContributionTitle: "Tu aportación mensual",
                price: "$8,200",
                occupantsInfo: "3 personas\nen el piso"
            )
        }
        .padding()
    }
}
