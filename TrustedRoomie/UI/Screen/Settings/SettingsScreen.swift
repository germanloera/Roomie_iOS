//
//  SettingsScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla principal de ajustes del usuario con accesos a datos personales, notificaciones, privacidad, modo oscuro y cierre de sesión.
/// Equivalente en SwiftUI al composable `SettingsScreen` de Jetpack Compose (`ui.screen.settings`).
@MainActor
public struct SettingsScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var bottomSheetVisibility: Bool = false
    @State private var darkModeEnabled: Bool = false

    public var onBackTap: (() -> Void)?
    public var onPersonalInfoTap: (() -> Void)?
    public var onNotificationsTap: (() -> Void)?
    public var onPrivacyTap: (() -> Void)?
    public var onLogoutTap: (() -> Void)?

    public init(
        onBackTap: (() -> Void)? = nil,
        onPersonalInfoTap: (() -> Void)? = nil,
        onNotificationsTap: (() -> Void)? = nil,
        onPrivacyTap: (() -> Void)? = nil,
        onLogoutTap: (() -> Void)? = nil
    ) {
        self.onBackTap = onBackTap
        self.onPersonalInfoTap = onPersonalInfoTap
        self.onNotificationsTap = onNotificationsTap
        self.onPrivacyTap = onPrivacyTap
        self.onLogoutTap = onLogoutTap
    }

    public var body: some View {
        ZStack {
            BaseScaffold(
                title: "Ajustes",
                onBackTap: onBackTap
            ) {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 13) {
                        SettingOptionItem(
                            title: "Datos personales",
                            subtitle: "Nombre, contacto y emergencias",
                            iconName: "ic_profile",
                            iconBackground: .clear
                        ) {
                            if let onPersonalInfoTap {
                                onPersonalInfoTap()
                            } else {
                                // router?.navigate(to: SettingsRoute.PersonalInfo)
                            }
                        }

                        SettingOptionItem(
                            title: "Notificaciones",
                            subtitle: "Push y correo",
                            iconName: "settings_notification",
                            iconBackground: .clear
                        ) {
                            if let onNotificationsTap {
                                onNotificationsTap()
                            } else {
                                // router?.navigate(to: SettingsRoute.Notifications)
                            }
                        }

                        SettingOptionItem(
                            title: "Privacidad y verificación",
                            iconName: "shield_check",
                            iconBackground: .clear
                        ) {
                            if let onPrivacyTap {
                                onPrivacyTap()
                            } else {
                                // router?.navigate(to: SettingsRoute.Privacy)
                            }
                        }

                        SwitchItem(
                            title: "Modo oscuro",
                            subtitle: "Desactivado",
                            iconName: "settings_icon",
                            iconBackground: .clear,
                            isOn: $darkModeEnabled
                        )

                        // Botón destructivo: Cerrar sesión
                        VStack(alignment: .leading, spacing: 0) {
                            SettingOptionItemContent(
                                title: "Cerrar sesión",
                                icon: Image("exit_icon"),
                                titleColor: Color.roomie.destructive,
                                iconBackground: .clear,
                                iconTint: Color.roomie.destructive,
                                rightIcon: nil
                            ) {
                                bottomSheetVisibility = true
                            }
                            .padding(6)
                        }
                        .frame(maxWidth: .infinity)
                        .background(RoomiePalette.cardContainerGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .stroke(Color.roomie.destructive, lineWidth: 1)
                        )
                        .shadow(color: Color.black.opacity(0.04), radius: 1, x: 0, y: 1)
                    }
                    .padding(.vertical, 10)
                    .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
            }

            LogoutBottomSheet(
                isPresented: $bottomSheetVisibility,
                onLogout: {
                    if let onLogoutTap {
                        onLogoutTap()
                    } else {
                        router?.popToRoot()
                    }
                }
            )
        }
    }
}

#Preview {
    NavigationStack {
        SettingsScreen()
    }
    .environment(NavigationRouter())
}
