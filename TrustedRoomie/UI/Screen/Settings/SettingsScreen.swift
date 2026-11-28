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
    @Environment(NavigationRouter.self) private var router: NavigationRouter
    @State private var onboarding : OnboardingViewModel = OnboardingViewModel()

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
        VStack(alignment: .leading, spacing: 16){
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 13) {
                    SettingOptionItem(
                        title: "settings.account.personal_info",
                        subtitle: "settings.personal_info.subtitle",
                        iconName: "ic_profile",
                        iconBackground: .clear
                    ) {
                        if let onPersonalInfoTap {
                            onPersonalInfoTap()
                        } else {
                            router.navigate(to: SettingsRoute.PersonalInfoScreen())
                        }
                    }
                    
                    SettingOptionItem(
                        title: "settings.preferences.notifications",
                        subtitle: "settings.notifications.subtitle",
                        iconName: "settings_notification",
                        iconBackground: .clear
                    ) {
                        if let onNotificationsTap {
                            onNotificationsTap()
                        } else {
                            router.navigate(to: SettingsRoute.NotificationsScreen())
                        }
                    }
                    
                    SettingOptionItem(
                        title: "settings.account.privacy",
                        iconName: "shield_check",
                        iconBackground: .clear
                    ) {
                        if let onPrivacyTap {
                            onPrivacyTap()
                        } else {
                            router.navigate(to: SettingsRoute.PrivacyScreen())
                        }
                    }
                    
                    SwitchItem(
                        title: "settings.dark_mode",
                        subtitle: "settings.dark_mode.off",
                        systemIcon: "lightbulb.slash", //lightbulb encendido
                        iconBackground: .clear,
                        isOn: $darkModeEnabled
                    )
                    
                    
                  
                        VStack(alignment: .leading, spacing: 0) {
                            SettingOptionItemContent(
                                title: "settings.logout",
                                icon: Image("exit_icon"),
                                titleColor: Color.roomie.destructive,
                                iconBackground: .clear,
                                iconTint: Color.roomie.destructive,
                                rightIcon: nil
                            ) {
                                
                                    router.presentBottomSheet(.logout(
                                        onLogout: {
                                            onboarding.logOut(router: router)
                    
                                        }
                                    ))
                              
                            }
                            .padding(6)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.roomie.destructiveContainer)
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
        
    }
    
}

#Preview {
    NavigationStack {
        SettingsScreen()
    }
    .BottomSheetGraph()
    .environment(NavigationRouter())
}
