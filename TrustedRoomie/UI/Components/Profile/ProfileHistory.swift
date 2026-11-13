//
//  ProfileHistory.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Modelo que describe una entrada en el historial de departamentos del perfil.
public struct ApartmentHistoryItem: Identifiable, Hashable, Sendable {
    public var id: String { "\(topText)_\(bottomText)" }
    public var topText: String
    public var bottomText: String

    public init(topText: String, bottomText: String) {
        self.topText = topText
        self.bottomText = bottomText
    }
}

/// Sección de historial de departamentos habitados por el usuario en su perfil.
/// Equivalente en SwiftUI al composable `ProfileHistory` de Jetpack Compose (`ui.components.profile`).
public struct ProfileHistory: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var items: [ApartmentHistoryItem]

    public static let defaultItems: [ApartmentHistoryItem] = [
        ApartmentHistoryItem(topText: "Roma Norte (actual)", bottomText: "mar 2025 – presente"),
        ApartmentHistoryItem(topText: "Condesa", bottomText: "ene 2024 – feb 2025"),
        ApartmentHistoryItem(topText: "Del Valle", bottomText: "jun 2022 – dic 2023"),
        ApartmentHistoryItem(topText: "Narvarte", bottomText: "ago 2020 – may 2022")
    ]

    public init(
        title: String = "Historial de Departamentos",
        items: [ApartmentHistoryItem] = defaultItems
    ) {
        self.title = title
        self.items = items
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.dmSans(.extraBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            BaseCard {
                VStack(spacing: 0) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        ApartmentItem(
                            topText: item.topText,
                            bottomText: item.bottomText
                        )

                        if index < items.count - 1 {
                            Rectangle()
                                .fill(Color.roomie.line)
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

/// Fila individual del historial de departamentos con icono y periodo de tiempo.
/// Equivalente en SwiftUI al composable `ApartmentItem` de Jetpack Compose (`ui.components.profile`).
public struct ApartmentItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var topText: String
    public var bottomText: String

    public init(
        topText: String = "Roma Norte (actual)",
        bottomText: String = "mar 2025 – presente"
    ) {
        self.topText = topText
        self.bottomText = bottomText
    }

    public var body: some View {
        HStack(spacing: 12) {
            Image("home_icon")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundStyle(Color.roomie.pine)

            VStack(alignment: .leading, spacing: 2) {
                Text(topText)
                    .font(.dmSans(.semiBold, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.ink)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(bottomText)
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.mute)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ProfileHistory()
        }
        .padding()
    }
}
