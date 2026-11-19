//
//  StarRatingBar.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente de barra de calificación con estrellas interactivas y etiqueta numérica opcional.
/// Equivalente en SwiftUI al composable `StarRatingBar` de Jetpack Compose (`ui.components.common`).
public struct StarRatingBar: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var maxStars: Int
    public var rating: Float
    public var showRating: Bool
    public var ratingText: String?
    public var starColor: Color
    public var onRatingChanged: ((Float) -> Void)?

    public init(
        maxStars: Int = 5,
        rating: Float = 4.5,
        showRating: Bool = true,
        starColor: Color = Color.roomie.star,
        ratingText: String? = nil,
        onRatingChanged: ((Float) -> Void)? = nil
    ) {
        self.maxStars = maxStars
        self.rating = rating
        self.showRating = showRating
        self.starColor = starColor
        self.ratingText = ratingText
        self.onRatingChanged = onRatingChanged
    }

    public init(
        maxStars: Int = 5,
        rating: Binding<Float>,
        showRating: Bool = true,
        starColor: Color = Color.roomie.star,
        ratingText: String? = nil
    ) {
        self.maxStars = maxStars
        self.rating = rating.wrappedValue
        self.showRating = showRating
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
                        .foregroundStyle(isSelected ? starColor : Color.roomie.mute.opacity(0.4))
                }
                .buttonStyle(.plain)
            }

            if showRating {
                Text(displayText)
                    .font(.dmSans(.semiBold, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.ink)
                    .padding(.leading, 5)
            }
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            StarRatingBar(rating: 4.5)

            StarRatingBar(maxStars: 5, rating: 3.0, showRating: false) { newRating in
                print("Nueva calificación: \(newRating)")
            }
        }
        .padding()
    }
}
