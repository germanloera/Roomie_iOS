//
//  ProfileSectionReview.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección que muestra la lista de reseñas recibidas por el usuario en su perfil.
/// Equivalente en SwiftUI al composable `ProfileReviewsSection` de Jetpack Compose (`ui.components.profile`).
public struct ProfileReviewsSection: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var reviewCount: Int

    public init(
        title: String = "Reseñas recibidas (1)",
        reviewCount: Int = 4
    ) {
        self.title = title
        self.reviewCount = reviewCount
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.dmSans(.extraBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            ForEach(0..<reviewCount, id: \.self) { _ in
                ListingReviewCard()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

// Typealiases para compatibilidad nominal con el archivo Kotlin (`ProfileSectionReview.kt`).
public typealias ProfileSectionReview = ProfileReviewsSection
public typealias ProfileReviewSection = ProfileReviewsSection

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ScrollView {
            ProfileReviewsSection()
                .padding()
        }
    }
}
