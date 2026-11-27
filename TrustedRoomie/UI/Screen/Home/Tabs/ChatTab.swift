//
//  ChatTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pestaña principal de mensajes y conversaciones activas dentro del Home.
/// Equivalente en SwiftUI al composable `ChatTab` de Jetpack Compose (`ui.screen.home.tabs`).
@MainActor
public struct ChatTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var conversationCount: Int

    public init(conversationCount: Int = 10) {
        self.conversationCount = conversationCount
    }

    public var body: some View {
        ChatTabContent(conversationCount: conversationCount)
    }
}

/// Contenido visual de la pestaña de mensajes con encabezado y lista de tarjetas de conversación.
/// Equivalente en SwiftUI al composable `ChatTabContent` de Jetpack Compose.
public struct ChatTabContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var conversationCount: Int
    public var onConversationTap: ((Int) -> Void)?

    public init(
        conversationCount: Int = 10,
        onConversationTap: ((Int) -> Void)? = nil
    ) {
        self.conversationCount = conversationCount
        self.onConversationTap = onConversationTap
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Encabezado con título
            VStack(alignment: .leading, spacing: 0) {
                Text("chats.title")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
            .padding(.bottom, 12)

            // Lista de conversaciones
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<conversationCount, id: \.self) { index in
                        ChatTenantConversationCard(
                            onTap: {
                                if let onConversationTap {
                                    onConversationTap(index)
                                } else {
                                    router?.navigate(to: HomeRoute.Messages())
                                    // router?.navigate(to: AppDestinations.Messages) // La ruta Messages aún no existe en NavigationRouter
                                }
                            }
                        )
                    }
                }
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
       // .background(RoomiePalette.ScreenBgBrush.ignoresSafeArea())
    }
}

// Typealiases para compatibilidad con el nombre del archivo Kotlin (`Chats.kt`).
public typealias ChatsTab = ChatTab
public typealias Chats = ChatTab

#Preview {
    ChatTab()
        .environment(NavigationRouter())
}
