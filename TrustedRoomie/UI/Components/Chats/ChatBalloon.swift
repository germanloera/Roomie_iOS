//
//  ChatBalloon.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Globo de mensaje entrante (izquierda) para la conversación de chat.
/// Equivalente en SwiftUI al composable `ChatBalloonLeft` de Jetpack Compose (`ui.components.chats`).
public struct ChatBalloonLeft: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var time: String

    public init(text: String = "", time: String = "") {
        self.text = text
        self.time = time
    }

    private var balloonShape: some Shape {
        UnevenRoundedRectangle(
            topLeadingRadius: 24,
            bottomLeadingRadius: 8,
            bottomTrailingRadius: 24,
            topTrailingRadius: 24,
            style: .continuous
        )
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(text)
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.ink)
                    .fixedSize(horizontal: false, vertical: true)

                if !time.isEmpty {
                    Text(time)
                        .font(.dmSans(.regular, size: 10))
                        .lineSpacing(14.29 - 10)
                        .foregroundStyle(Color.roomie.mute)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 257, alignment: .leading)
            .background(Color.roomie.cardGlass)
            .clipShape(balloonShape)
            .overlay(
                balloonShape
                    .stroke(Color.roomie.line, lineWidth: 1)
            )

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/// Globo de mensaje saliente (derecha) para la conversación de chat.
/// Equivalente en SwiftUI al composable `ChatBalloonRight` de Jetpack Compose (`ui.components.chats`).
public struct ChatBalloonRight: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var time: String

    public init(text: String = "", time: String = "") {
        self.text = text
        self.time = time
    }

    private var balloonShape: some Shape {
        UnevenRoundedRectangle(
            topLeadingRadius: 24,
            bottomLeadingRadius: 24,
            bottomTrailingRadius: 8,
            topTrailingRadius: 24,
            style: .continuous
        )
    }

    public var body: some View {
        HStack {
            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text(text)
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.messageText)
                    .fixedSize(horizontal: false, vertical: true)

                if !time.isEmpty {
                    Text(time)
                        .font(.dmSans(.regular, size: 10))
                        .lineSpacing(14.29 - 10)
                        .foregroundStyle(Color.roomie.messageTime)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 257, alignment: .leading)
            .background(Color.roomie.pine)
            .clipShape(balloonShape)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

// Typealiases para compatibilidad con la denominación del archivo Kotlin (`ChatBallon.kt`).
public typealias ChatBallonLeft = ChatBalloonLeft
public typealias ChatBallonRight = ChatBalloonRight

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ScrollView {
            VStack(spacing: 10) {
                ChatBalloonLeft(
                    text: "Hola Diego, la habitación sigue libre. ¿Quieres agendar una visita?",
                    time: "9:15"
                )

                ChatBalloonRight(
                    text: "Hola Mariana, sí me interesa mucho. ¿Podría ser mañana por la tarde?",
                    time: "9:18"
                )
            }
            .padding()
        }
    }
}
