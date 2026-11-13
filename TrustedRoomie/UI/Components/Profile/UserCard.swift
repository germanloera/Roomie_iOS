//
//  UserCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Tarjeta principal de perfil de usuario que muestra avatar, nombre, alias, rol y distintivos de verificación y calificación.
/// Equivalente en SwiftUI al composable `UserCard` de Jetpack Compose (`ui.components.profile`).
public struct UserCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var initials: String
    public var name: String
    public var nickname: String
    public var role: String
    public var verifiedText: String
    public var ratingText: String
    public var avatarColor: Color

    public init(
        initials: String = "MR",
        name: String = "Mariana Ruiz",
        nickname: String = "“Mar”",
        role: String = "Titular del contrato",
        verifiedText: String = "Identidad verificada",
        ratingText: String = "5.0 promedio",
        avatarColor: Color = Color.roomie.warn
    ) {
        self.initials = initials
        self.name = name
        self.nickname = nickname
        self.role = role
        self.verifiedText = verifiedText
        self.ratingText = ratingText
        self.avatarColor = avatarColor
    }

    public var body: some View {
        BaseCard {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(avatarColor)
                        .frame(width: 72, height: 72)

                    Text(initials)
                        .font(.dmSans(.semiBold, size: 27.36))
                        .lineSpacing(41.04 - 27.36)
                        .foregroundStyle(Color.white)
                }
                .frame(width: 72, height: 72)

                Text(name)
                    .font(.fraunces(.semiBold, size: 24))
                    .lineSpacing(32 - 24)
                    .foregroundStyle(Color.roomie.ink)
                    .multilineTextAlignment(.center)

                if !nickname.isEmpty {
                    Text(nickname)
                        .font(.dmSans(.regular, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.mute)
                        .multilineTextAlignment(.center)
                }

                if !role.isEmpty {
                    Text(role)
                        .font(.dmSans(.regular, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.mute)
                        .multilineTextAlignment(.center)
                }

                HStack(spacing: 8) {
                    GreenChip(text: verifiedText, iconName: "shield_check")
                    YellowChip(text: ratingText)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            UserCard()
        }
        .padding()
    }
}
