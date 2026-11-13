//
//  RoomInfoPill.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pastilla informativa que muestra el contexto del anuncio y su estado de disponibilidad dentro del chat.
/// Equivalente en SwiftUI al composable `RoomInfoPill` de Jetpack Compose (`ui.components.chats`).
public struct RoomInfoPill: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var prefix: String
    public var location: String
    public var statusText: String

    public init(
        prefix: String = "Anuncio: ",
        location: String = "Condesa, CDMX",
        statusText: String = "Disponible"
    ) {
        self.prefix = prefix
        self.location = location
        self.statusText = statusText
    }

    private var highlightedText: AttributedString {
        let fullText = "\(prefix)\(location)"
        return fullText.highlight(words: [location], color: Color.roomie.ink)
    }

    public var body: some View {
        HStack(alignment: .center) {
            BasicText(highlightedText)
                .font(.dmSans(.semiBold, size: 12))
                .lineSpacing(16 - 12)
                .foregroundStyle(Color.roomie.mute)
                .multilineTextAlignment(.leading)

            Spacer()

            GreenChip(text: statusText)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(Color.roomie.sand)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            RoomInfoPill()

            RoomInfoPill(
                prefix: "Propiedad: ",
                location: "Roma Norte, Cuauhtémoc",
                statusText: "Apartado"
            )
        }
        .padding()
    }
}
