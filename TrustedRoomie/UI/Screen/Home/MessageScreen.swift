//
//  MessageScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla de conversación de chat individual entre usuarios.
/// Equivalente en SwiftUI al composable `MessageScreen` de Jetpack Compose (`ui.screen`).
@MainActor
public struct MessageScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var subtitle: String
    public var onBackTap: (() -> Void)?
    public var onSendMessage: ((String) -> Void)?

    public init(
        title: String = "Andrés Vela",
        subtitle: String = "Habitación en depa con terraza",
        onBackTap: (() -> Void)? = nil,
        onSendMessage: ((String) -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.onBackTap = onBackTap
        self.onSendMessage = onSendMessage
    }

    public var body: some View {
  
            VStack(alignment: .leading, spacing: 10) {
                RoomInfoPill()

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ChatBalloonRight(
                            text: "Hola Diego, la habitación sigue libre. ¿Quieres agendar una visita?",
                            time: "9:15"
                        )

                        ChatBalloonLeft(
                            text: "Hola Diego, la habitación sigue libre. ¿Quieres agendar una visita?",
                            time: "9:15"
                        )

                        ChatBalloonRight(
                            text: "Hola Diego, la habitación sigue libre. ¿Quieres agendar una visita?",
                            time: "9:15"
                        )

                        ChatBalloonLeft(
                            text: "Hola Diego, la habitación sigue libre. ¿Quieres agendar una visita?",
                            time: "9:15"
                        )
                    }
                    .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
                ChatMessageBox(
                    placeholder: "Escribe un mensaje...",
                    onSend: onSendMessage
                )
            }
        
    }
}

#Preview {
    NavigationStack {
        MessageScreen()
    }
    .environment(NavigationRouter())
}
