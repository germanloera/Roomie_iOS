//
//  StarRatingBar.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente de barra de calificación con estrellas interactivas y etiqueta numérica.
/// Equivalente en SwiftUI al composable `StarRatingBar` de Jetpack Compose.
public struct StarRatingBar: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public static let defaultStarColor = Color(red: 1.0, green: 199.0 / 255.0, blue: 0.0) // 0xFFFFC700

    public var maxStars: Int
    public var rating: Float
    public var ratingText: String?
    public var starColor: Color
    public var onRatingChanged: ((Float) -> Void)?

    public init(
        maxStars: Int = 5,
        rating: Float = 4.5,
        onRatingChanged: ((Float) -> Void)? = nil,
        starColor: Color = defaultStarColor,
        ratingText: String? = nil
    ) {
        self.maxStars = maxStars
        self.rating = rating
        self.onRatingChanged = onRatingChanged
        self.starColor = starColor
        self.ratingText = ratingText
    }

    public init(
        maxStars: Int = 5,
        rating: Binding<Float>,
        starColor: Color = defaultStarColor,
        ratingText: String? = nil
    ) {
        self.maxStars = maxStars
        self.rating = rating.wrappedValue
        self.starColor = starColor
        self.ratingText = ratingText
        self.onRatingChanged = { newValue in
            rating.wrappedValue = newValue
        }
    }

    private var displayText: String {
        if let ratingText {
            return ratingText
        }
        return String(format: "%.1f", rating)
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(1...maxStars, id: \.self) { index in
                let isSelected = Float(index) <= rating

                Button {
                    onRatingChanged?(Float(index))
                } label: {
                    Image(systemName: isSelected ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        // .foregroundStyle(isSelected ? starColor : Color.gray)
                        .foregroundStyle(isSelected ? starColor : Color.roomie.mute)
                }
                .buttonStyle(.plain)
            }

            Text(displayText)
                .font(.system(size: 14, weight: .semibold))
                .dmSansFont(.semiBold, size: 14)
                .lineSpacing(20 - 14)
                // .foregroundStyle(InkLight)
                .foregroundStyle(Color.roomie.ink)
                .padding(.leading, 5)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            StarRatingBar(rating: 4.5)

            StarRatingBar(maxStars: 5, rating: 3.0) { newRating in
                print("Nueva calificación: \(newRating)")
            }
        }
        .padding()
    }
}
