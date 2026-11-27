//
//  RateRoomie.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pantalla para calificar y dejar una reseña a un roomie o inquilino.
/// Equivalente en SwiftUI al composable `RateRoomie` de Jetpack Compose (`ui.screen.home`).
@MainActor
public struct RateRoomie: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var subtitle: String
    public var onBackTap: (() -> Void)?
    public var onPublishReviewTap: (() -> Void)?

    public init(
        title: String = "Dejar reseña",
        subtitle: String = "Reseña del inquilino",
        onBackTap: (() -> Void)? = nil,
        onPublishReviewTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.onBackTap = onBackTap
        self.onPublishReviewTap = onPublishReviewTap
    }

    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                RateItem()

                Text(
                    "roomies.rate.disclaimer"
                )
                .font(.dmSans(.regular, size: 12))
                .lineSpacing(16 - 12)
                .foregroundStyle(Color.roomie.mute)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            BottomCTAButton(
                text: "roomies.rate.submit",
                color: Color.roomie.pine
            ) {
                if let onPublishReviewTap {
                    onPublishReviewTap()
                } else {
                    router?.back()
                }
            }
        }
    }
}

#Preview {
    RateRoomie()
        .environment(NavigationRouter())
}
