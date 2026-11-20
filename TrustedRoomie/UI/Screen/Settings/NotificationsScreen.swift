//
//  NotificationsScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla de configuración de notificaciones y canales de avisos del usuario.
/// Equivalente en SwiftUI al composable `NotificationsScreen` de Jetpack Compose (`ui.screen.settings`).
@MainActor
public struct NotificationsScreen: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var pushNotificationsEnabled: Bool = false
    @State private var emailNotificationsEnabled: Bool = false

    public var onBackTap: (() -> Void)?

    public init(onBackTap: (() -> Void)? = nil) {
        self.onBackTap = onBackTap
    }

    public var body: some View {
       VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Elige cómo quieres enterarte de mensajes, invitaciones, pagos e incidentes.")
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 13) {
                        Text("Canales")
                            .font(.dmSans(.extraBold, size: 13))
                            .lineSpacing(19.5 - 13)
                            .tracking(0.65)
                            .foregroundStyle(Color.roomie.mute)
                            .padding(.top, 4)

                        SwitchItem(
                            title: "Modo oscuro",
                            subtitle: "Desactivado",
                            iconName: "settings_icon",
                            iconBackground: .clear,
                            isOn: $pushNotificationsEnabled
                        )

                        SwitchItem(
                            title: "Modo oscuro",
                            subtitle: "Desactivado",
                            iconName: "settings_icon",
                            iconBackground: .clear,
                            isOn: $emailNotificationsEnabled
                        )

                        HStack(alignment: .top, spacing: 8) {
                            Image("shield_check")
                                .renderingMode(.template)
                                .foregroundStyle(Color.roomie.pine)

                            Text("Las alertas dentro de la app permanecen disponibles en la pestaña Avisos, aunque desactives estos canales.")
                                .font(.dmSans(.regular, size: 12))
                                .lineSpacing(16 - 12)
                                .foregroundStyle(Color.roomie.mute)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Group {
                                if colorScheme == .dark {
                                    RoomiePalette.cardDarkContainerGradient
                                } else {
                                    Beige_A45_D6
                                }
                            }
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .stroke(Color.roomie.cardBorder, lineWidth: 1)
                        )
                    }
                    .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

public typealias NotificationScreen = NotificationsScreen

#Preview {
    NavigationStack {
        NotificationsScreen()
    }
    .environment(NavigationRouter())
}
