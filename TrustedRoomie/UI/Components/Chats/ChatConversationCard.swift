//
//  ChatConversationCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Tarjeta de conversación con el titular en la lista de chats.
/// Equivalente en SwiftUI al composable `ChatTenantConversationCard` de Jetpack Compose (`ui.components.chats`).
public struct ChatTenantConversationCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var initials: String
    public var name: String
    public var statusText: String
    public var lastMessage: String
    public var avatarColor: Color
    public var onTap: (() -> Void)?

    public init(
        initials: String = "MR",
        name: String = "Mariana Ruiz",
        statusText: String = "Disponible",
        lastMessage: String = "Hola Diego, la habitación sigue libre. ¿Quieres agendar una visita?",
        avatarColor: Color = Color.roomie.warn,
        onTap: (() -> Void)? = nil
    ) {
        self.initials = initials
        self.name = name
        self.statusText = statusText
        self.lastMessage = lastMessage
        self.avatarColor = avatarColor
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            if let onTap {
                onTap()
            } else {
                // router?.navigate(to: AppDestinations.Messages) // La ruta Messages aún no existe en NavigationRouter
            }
        } label: {
            BaseCard {
                HStack(alignment: .center, spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(avatarColor)
                            .frame(width: 40, height: 40)

                        Text(initials)
                            .font(.dmSans(.semiBold, size: 15.2))
                            .lineSpacing(22.8 - 15.2)
                            .foregroundStyle(Color.white)
                    }
                    .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 2) {
                        HStack(alignment: .top) {
                            Text(name)
                                .font(.dmSans(.semiBold, size: 16))
                                .lineSpacing(24 - 16)
                                .foregroundStyle(Color.roomie.ink)

                            Spacer()

                            GreenChip(text: statusText)
                        }
                        .frame(maxWidth: .infinity)

                        Text(lastMessage)
                            .font(.dmSans(.regular, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.mute)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .buttonStyle(.plain)
    }
}

// Typealiases para compatibilidad con la denominación del archivo Kotlin (`ChatConversationCard.kt`).
public typealias ChatConversationCard = ChatTenantConversationCard

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 12) {
            ChatTenantConversationCard()

            ChatTenantConversationCard(
                initials: "CP",
                name: "Carlos Parra",
                statusText: "Ocupado",
                lastMessage: "Nos vemos mañana a las 5 pm para revisar el contrato."
            )
        }
        .padding()
    }
}
