//
//  HomeGreenHeaderCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Tarjeta verde de resumen financiero / recaudación en el inicio para arrendatarios.
/// Equivalente en SwiftUI al composable `HomeGreenHeaderCard` de Jetpack Compose (`ui.components.home`).
public struct HomeGreenHeaderCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: LocalizedText
    public var amount: String
    public var subtitle: LocalizedText
    public var onTap: (() -> Void)?

    public init(
        title: LocalizedText = "home.overview.collected_this_month",
        amount: String = "$4,125",
        subtitle: LocalizedText = "home.overview.pending_confirmation",
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.amount = amount
        self.subtitle = subtitle
        self.onTap = onTap
    }

    
    public init(
        title: String,
        amount: String = "$4,125",
        subtitle: String = "",
        onTap: (() -> Void)? = nil
    ) {
        self.init(
            title: LocalizedText(title),
            amount: amount,
            subtitle: LocalizedText(subtitle),
            onTap: onTap
        )
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                title.text
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.homeGreenCardSubtitle)

                Text(amount)
                    .font(.fraunces(.semiBold, size: 36))
                    .lineSpacing(40 - 36)
                    .foregroundStyle(Color.roomie.homeGreenCardText)
                    .padding(.vertical, 2)

                subtitle.text
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.homeGreenCardSubtitle)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color.roomie.homeGreenCardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        HomeGreenHeaderCard()
            .padding()
    }
}
