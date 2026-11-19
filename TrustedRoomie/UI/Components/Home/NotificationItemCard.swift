//
//  NotificationItemCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Tarjeta de notificación / mensaje en la pantalla de inicio con avatar/icono, título, vista previa y punto de estado no leído.
/// Equivalente en SwiftUI al composable `NotificationItemCard` de Jetpack Compose (`ui.components.home`).
public struct NotificationItemCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var message: String
    public var isUnread: Bool
    public var icon: Image
    public var onTap: (() -> Void)?

    public init(
        title: String = "Andrés Vela te respondió",
        message: String = "Hola Diego, la habitación sigue libre…",
        isUnread: Bool = true,
        icon: Image = Image("message"),
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.isUnread = isUnread
        self.icon = icon
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            if let onTap {
                onTap()
            } else {
                // router?.navigate(to: AppDestination.messages) // Estructura preparada según Regla 5
            }
        } label: {
            BaseCard {
                HStack(spacing: 12) {
                    // Contenedor de icono circular
                    ZStack {
                        Circle()
                            .fill(Color.roomie.pineContainer)
                            .frame(width: 40, height: 40)

                        icon
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.roomie.pine)
                    }
                    .frame(width: 40, height: 40)

                    // Textos de notificación
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(.dmSans(.semiBold, size: 16))
                            .lineSpacing(24 - 16)
                            .foregroundStyle(Color.roomie.ink)
                            .lineLimit(1)

                        Text(message)
                            .font(.dmSans(.regular, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.mute)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Indicador de no leído
                    if isUnread {
                        Circle()
                            .fill(Color.roomie.clay)
                            .frame(width: 8, height: 8)
                    }
                }
                .contentShape(Rectangle())
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 12) {
            NotificationItemCard()

            NotificationItemCard(
                title: "Mariana te envió un mensaje",
                message: "¿Aún está disponible la recámara?",
                isUnread: false
            )
        }
        .padding()
    }
}
