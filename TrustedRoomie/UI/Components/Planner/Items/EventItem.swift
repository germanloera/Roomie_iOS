//
//  EventItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Elemento de tarjeta que representa un evento en el planificador con badge de fecha y botón para eliminar opcional.
/// Equivalente en SwiftUI al composable `EventItem` de Jetpack Compose (`ui.components.planner.items`).
public struct EventItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var dateText: String
    public var title: String
    public var time: String
    public var readOnly: Bool
    public var onTap: (() -> Void)?

    public init(
        dateText: String = "12 jul",
        title: String = "Cena de roomies",
        time: String = "8:00 pm",
        readOnly: Bool = false,
        onTap: (() -> Void)? = nil
    ) {
        self.dateText = dateText
        self.title = title
        self.time = time
        self.readOnly = readOnly
        self.onTap = onTap
    }

    public var body: some View {
        BaseCard(padding: 16) {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center, spacing: 12) {
                    // Badge con la fecha
                    ZStack {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.roomie.pineContainer)
                            .frame(width: 48, height: 48)

                        Text(dateText)
                            .font(.dmSans(.extraBold, size: 11))
                            .lineSpacing(13.75 - 11)
                            .foregroundStyle(Color.roomie.pine)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 48, height: 48)

                    // Textos del evento
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(.dmSans(.semiBold, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.ink)

                        Text(time)
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Botón para eliminar
                    if !readOnly {
                        Button {
                            onTap?()
                        } label: {
                            Image(systemName: "trash")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundStyle(Color.roomie.pine)
                                .frame(width: 17, height: 17)
                                .padding(1)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Eliminar evento")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 12) {
            EventItem()
            EventItem(readOnly: true)
        }
        .padding()
    }
}
