//
//  ListingInfoSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Sección de información del listing con etiqueta de disponibilidad, valoración con estrellas, título y ubicación.
/// Equivalente en SwiftUI al composable `ListingInfoSection` de Jetpack Compose.
public struct ListingInfoSection: View {
    public var status: String
    public var rating: Float
    public var title: String
    public var locationDetails: String
    public var onRatingChanged: ((Float) -> Void)?

    public init(
        status: String = "Disponible",
        rating: Float = 4.5,
        title: String = "Cuarto luminoso en la Roma Norte",
        locationDetails: String = "Roma Norte, CDMX · 14 m2, baño compartido",
        onRatingChanged: ((Float) -> Void)? = nil
    ) {
        self.status = status
        self.rating = rating
        self.title = title
        self.locationDetails = locationDetails
        self.onRatingChanged = onRatingChanged
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center) {
                GreenChip(text: status)

                Spacer()

                StarRatingBar(rating: rating) { newRating in
                    onRatingChanged?(newRating)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 8)

            Text(title)
                .font(.system(size: 26, weight: .regular, design: .serif))
                .frauncesFont(.regular, size: 26)
                .lineSpacing(32.5 - 26)
                .foregroundStyle(InkLight)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .center, spacing: 4) {
                Image("outline_location_on_24")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(MuteLight)

                Text(locationDetails)
                    .font(.system(size: 14, weight: .regular))
                    .dmSansFont(.regular, size: 14)
                    .lineSpacing(20 - 14)
                    .foregroundStyle(MuteLight)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            ListingInfoSection()
        }
        .padding()
    }
}
