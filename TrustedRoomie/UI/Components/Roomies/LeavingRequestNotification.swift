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

    public var title: String
    public var subtitle: String
    public var chipText: String

    public init(
        title: String = "Solicitud de salida enviada",
        subtitle: String = "Esperando que el titular defina la fecha y confirme.",
        chipText: String = "5.0 promedio"
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chipText = chipText
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .font(.dmSans(.semiBold, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.ink)

            Text(subtitle)
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
