//
//  NotificationsTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pestaña principal de notificaciones y avisos del usuario dentro del Home.
/// Equivalente en SwiftUI al composable `NotificationsTab` de Jetpack Compose (`ui.screen.home.tabs`).
@MainActor
public struct NotificationsTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var notificationCount: Int
    public var onMarkAllAsRead: (() -> Void)?

    public init(
        notificationCount: Int = 10,
        onMarkAllAsRead: (() -> Void)? = nil
    ) {
        self.notificationCount = notificationCount
        self.onMarkAllAsRead = onMarkAllAsRead
    }

    public var body: some View {
        NotificationsTabContent(
            notificationCount: notificationCount,
            onMarkAllAsRead: onMarkAllAsRead
        )
    }
}

/// Contenido visual de la pestaña de notificaciones con encabezado, acción de marcar leídas y lista de avisos.
/// Equivalente en SwiftUI al contenido interno de `NotificationsTab` de Jetpack Compose.
public struct NotificationsTabContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var notificationCount: Int
    public var onMarkAllAsRead: (() -> Void)?
    public var onNotificationTap: ((Int) -> Void)?

    public init(
        notificationCount: Int = 10,
        onMarkAllAsRead: (() -> Void)? = nil,
        onNotificationTap: ((Int) -> Void)? = nil
    ) {
        self.notificationCount = notificationCount
        self.onMarkAllAsRead = onMarkAllAsRead
        self.onNotificationTap = onNotificationTap
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Encabezado con título, acción y descripción
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center) {
                    Text("Notificaciones")
                        .font(.fraunces(.regular, size: 24))
                        .lineSpacing(30 - 24)
                        .foregroundStyle(Color.roomie.ink)

                    Spacer()

                    Button {
                        onMarkAllAsRead?()
                    } label: {
                        Text("Marcar leídas")
                            .font(.dmSans(.semiBold, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.pine)
                            .multilineTextAlignment(.center)
                    }
                    .buttonStyle(.plain)
                }
                .frame(maxWidth: .infinity)

                Text("Como usuario registrado recibes avisos de chat, invitaciones y respuestas a tus solicitudes.")
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.mute)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
            .padding(.bottom, 12)

            // Lista de notificaciones
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<notificationCount, id: \.self) { index in
                        NotificationItemCard(
                            onTap: {
                                if let onNotificationTap {
                                    onNotificationTap(index)
                                } else {
                                    // router?.navigate(to: AppDestinations.Messages) // Ruta pendiente en NavigationRouter
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
        .background(RoomiePalette.ScreenBgBrush.ignoresSafeArea())
    }
}

// Typealiases para compatibilidad con el archivo Kotlin (`Notifications.kt`).
public typealias Notifications = NotificationsTab

#Preview {
    NotificationsTab()
        .environment(NavigationRouter())
}
