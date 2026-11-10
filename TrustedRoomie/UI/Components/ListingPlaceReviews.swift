//
//  ListingPlaceReviews.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Sección que muestra la información del titular del alojamiento y las reseñas de los huéspedes.
/// Equivalente en SwiftUI al composable `ListingPlaceReviews` de Jetpack Compose.
public struct ListingPlaceReviews: View {
    public var title: String

    public init(title: String = "Titular y reseñas (2)") {
        self.title = title
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.system(size: 13, weight: .bold))
                .dmSansFont(.semiBold, size: 13)
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color(hex: 0x7A837F))

            ListingTenantReview()
            ListingReviewCard()
            ListingReviewCard()
            ListingReviewCard()
            ListingReviewCard()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

/// Tarjeta que muestra el avatar, nombre e indicador de verificación del titular.
/// Equivalente en SwiftUI al composable `ListingTenantReview` de Jetpack Compose.
public struct ListingTenantReview: View {
    public var initials: String
    public var name: String
    public var verificationStatus: String
    public var avatarColor: Color

    public init(
        initials: String = "MR",
        name: String = "Mariana Ruiz",
        verificationStatus: String = "Titular verificado",
        avatarColor: Color = Color(hex: 0xB7791F)
    ) {
        self.initials = initials
        self.name = name
        self.verificationStatus = verificationStatus
        self.avatarColor = avatarColor
    }

    public var body: some View {
        BaseCard {
            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(avatarColor)
                        .frame(width: 40, height: 40)

                    Text(initials)
                        .font(.system(size: 15.2, weight: .semibold))
                        .dmSansFont(.semiBold, size: 15.2)
                        .lineSpacing(22.8 - 15.2)
                        .foregroundStyle(Color.white)
                }
                .frame(width: 40, height: 40)

                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.system(size: 16, weight: .semibold))
                        .dmSansFont(.semiBold, size: 16)
                        .lineSpacing(24 - 16)
                        .foregroundStyle(Color(hex: 0x1F2A27))

                    HStack(spacing: 4) {
                        Image("shield_check")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 13, height: 13)

                        Text(verificationStatus)
                            .font(.system(size: 12, weight: .regular))
                            .dmSansFont(.regular, size: 12)
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color(hex: 0x7A837F))
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

/// Tarjeta de reseña individual con calificación con estrellas y comentario.
/// Equivalente en SwiftUI al composable `ListingReviewCard` de Jetpack Compose.
public struct ListingReviewCard: View {
    public var author: String
    public var target: String
    public var rating: Float
    public var comment: String
    public var onRatingChanged: ((Float) -> Void)?

    public init(
        author: String = "Andrea M.",
        target: String = "Mariana Ruiz",
        rating: Float = 4.0,
        comment: String = "Depa cálido y bien ubicado. El agua caliente tarda un poco.",
        onRatingChanged: ((Float) -> Void)? = nil
    ) {
        self.author = author
        self.target = target
        self.rating = rating
        self.comment = comment
        self.onRatingChanged = onRatingChanged
    }

    private var highlightedText: AttributedString {
        let fullText = "\(author) sobre \(target)"
        return fullText.highlight(words: [author], color: InkLight)
    }

    public var body: some View {
        BaseCard {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center) {
                    BasicText(highlightedText)
                        .font(.system(size: 12, weight: .semibold))
                        .dmSansFont(.semiBold, size: 12)
                        .lineSpacing(16 - 12)
                        .foregroundStyle(MuteLight)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    StarRatingBar(rating: rating) { newRating in
                        onRatingChanged?(newRating)
                    }
                }
                .frame(maxWidth: .infinity)

                Text(comment)
                    .font(.system(size: 14, weight: .regular))
                    .dmSansFont(.regular, size: 14)
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color(argb: 0xCC1F2A27))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ScrollView {
            ListingPlaceReviews()
                .padding()
        }
    }
}
