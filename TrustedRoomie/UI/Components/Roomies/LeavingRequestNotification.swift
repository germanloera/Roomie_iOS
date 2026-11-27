//
//  LeavingRequestNotification.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Notificación o tarjeta destacada que indica que se ha enviado una solicitud de salida.
/// Equivalente en SwiftUI al composable `LeavingRequestNotification` de Jetpack Compose (`ui.components.roomies`).
public struct LeavingRequestNotification: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: LocalizedText
    public var subtitle: LocalizedText
    public var chipText: LocalizedText

    public init(
        title: LocalizedText = "roomies.leaving_request.sent_title",
        subtitle: LocalizedText = "roomies.leaving_request.sent_subtitle",
        chipText: LocalizedText = "5.0 promedio"
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chipText = chipText
    }

    
    public init(
        title: String,
        subtitle: String = "",
        chipText: String = ""
    ) {
        self.init(
            title: LocalizedText(title),
            subtitle: LocalizedText(subtitle),
            chipText: LocalizedText(chipText)
        )
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            title.text
                .font(.dmSans(.semiBold, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.ink)

            subtitle.text
                .font(.dmSans(.regular, size: 12))
                .lineSpacing(16 - 12)
                .foregroundStyle(Color.roomie.mute)
                .padding(.bottom, 10)

            YellowChip(text: chipText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.roomie.leavingRequestBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(Color.roomie.leavingRequestBorder, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            LeavingRequestNotification()
        }
        .padding()
    }
}
