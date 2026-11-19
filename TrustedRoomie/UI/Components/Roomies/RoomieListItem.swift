//
//  RoomieListItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Elemento de tarjeta que representa un roomie en la lista de compañeros de vivienda con avatar, nombre, antigüedad y chip de reseña.
/// Equivalente en SwiftUI al composable `RoomieListItem` de Jetpack Compose (`ui.components.roomies`).
public struct RoomieListItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var initial: String
    public var name: String
    public var sinceDate: String
    public var chipText: String
    public var onChipTap: (() -> Void)?

    public init(
        initial: String = "M",
        name: String = "Diego Fernández",
        sinceDate: String = "Desde mar 2025",
        chipText: String = "Reseñar",
        onChipTap: (() -> Void)? = nil
    ) {
        self.initial = initial
        self.name = name
        self.sinceDate = sinceDate
        self.chipText = chipText
        self.onChipTap = onChipTap
    }

    public var body: some View {
        BaseCard {
            HStack(alignment: .center, spacing: 8) {
                // Avatar circular con inicial
                ZStack {
                    Circle()
                        .fill(Color.roomie.warn)
                        .frame(width: 30, height: 30)

                    Text(initial)
                        .font(.dmSans(.semiBold, size: 11.4))
                        .lineSpacing(17.1 - 11.4)
                        .foregroundStyle(Color.roomie.messageText)
                }
                .frame(width: 30, height: 30)

                // Nombre y fecha de inicio
                VStack(alignment: .leading, spacing: 0) {
                    Text(name)
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink)

                    Text(sinceDate)
                        .font(.dmSans(.regular, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.mute)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Chip de acción para reseñar
                Button {
                    onChipTap?()
                } label: {
                    Chip(
                        text: chipText,
                        color: Color.roomie.pineContainer,
                        textColor: Color.roomie.onPineContainer
                    )
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            RoomieListItem()
        }
        .padding()
    }
}
