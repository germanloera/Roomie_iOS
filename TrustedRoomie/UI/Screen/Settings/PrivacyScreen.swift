//
//  PrivacyScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla de privacidad, seguridad y verificación del usuario.
/// Equivalente en SwiftUI al composable `PrivacyScreen` de Jetpack Compose (`ui.screen.settings`).
@MainActor
public struct PrivacyScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var showContactNumbers: Bool = true

    public var onBackTap: (() -> Void)?
    public var onChangePasswordTap: (() -> Void)?
    public var onPersonalInfoTap: (() -> Void)?

    public init(
        onBackTap: (() -> Void)? = nil,
        onChangePasswordTap: (() -> Void)? = nil,
        onPersonalInfoTap: (() -> Void)? = nil
    ) {
        self.onBackTap = onBackTap
        self.onChangePasswordTap = onChangePasswordTap
        self.onPersonalInfoTap = onPersonalInfoTap
    }

    public var body: some View {
      VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 13) {
                    Text("settings.privacy.security".uppercased())
                        .font(.dmSans(.extraBold, size: 13))
                        .lineSpacing(19.5 - 13)
                        .tracking(0.65)
                        .foregroundStyle(Color.roomie.mute)
                        .padding(.top, 4)

                    SettingOptionItem(
                        title: "settings.account.change_password",
                        subtitle: "settings.change_password.subtitle",
                        iconName: "lock_white",
                        iconBackground: Color.roomie.pineContainer
                    ) {
                        if let onChangePasswordTap {
                            onChangePasswordTap()
                        } else {
                            router?.navigate(to: SettingsRoute.ChangePasswordScreen())
                        }
                    }

                    Text("settings.privacy.contact_visibility".uppercased())
                        .font(.dmSans(.extraBold, size: 13))
                        .lineSpacing(19.5 - 13)
                        .tracking(0.65)
                        .foregroundStyle(Color.roomie.mute)
                        .padding(.top, 8)

                    SwitchItem(
                        title: "settings.privacy.show_phone",
                        subtitle: "settings.privacy.show_phone.subtitle",
                        iconName: "ic_person_large",
                        iconBackground: Color.roomie.pineContainer,
                        isOn: $showContactNumbers
                    )

                    Text("settings.privacy.verification".uppercased())
                        .font(.dmSans(.extraBold, size: 13))
                        .lineSpacing(19.5 - 13)
                        .tracking(0.65)
                        .foregroundStyle(Color.roomie.mute)
                        .padding(.top, 8)

                    SettingOptionItem(
                        title: "settings.privacy.identity_verified",
                        subtitle: "settings.privacy.identity_verified.subtitle",
                        iconName: "shield_check",
                        rightIcon: nil
                    ) {
                        if let onPersonalInfoTap {
                            onPersonalInfoTap()
                        } else {
                            router?.navigate(to: SettingsRoute.PersonalInfoScreen())
                        }
                    }
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
        PrivacyScreen()
    }
    .environment(NavigationRouter())
}
