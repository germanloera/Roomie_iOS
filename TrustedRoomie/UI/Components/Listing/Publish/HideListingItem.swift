//
//  HideListingItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Componente de tarjeta para alternar la visibilidad de un anuncio publicado.
/// Equivalente en SwiftUI al composable `HideListingItem` de Jetpack Compose (`ui.components.listing.publish`).
public struct HideListingItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var subtitle: String
    public var actionText: String
    public var onToggleVisibility: (() -> Void)?

    public init(
        title: String = "Anuncio visible",
        subtitle: String = "Los usuarios pueden encontrarlo y contactarte.",
        actionText: String = "Ocultar",
        onToggleVisibility: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.actionText = actionText
        self.onToggleVisibility = onToggleVisibility
    }

    public var body: some View {
        BaseListingCardSection(label: "Ocultar anuncio") {
            HStack(alignment: .center, spacing: 12) {
                // Icono circular explorador
                ZStack {
                    Circle()
                        .fill(Color.roomie.pineContainer)
                        .frame(width: 40, height: 40)

                    Image("ic_explore")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.roomie.pine)
                }
                .frame(width: 40, height: 40)

                // Textos descriptivos
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.dmSans(.semiBold, size: 16))
                        .lineSpacing(24 - 16)
                        .foregroundStyle(Color.roomie.ink)

                    Text(subtitle)
                        .font(.dmSans(.regular, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.mute)
                        .lineLimit(3)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Chip de acción
                Button {
                    onToggleVisibility?()
                } label: {
                    Chip(
                        text: actionText,
                        color: Color.roomie.pineContainer,
                        textColor: Color.roomie.pine
                    )
                }
                .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            HideListingItem()
        }
        .padding()
    }
}
