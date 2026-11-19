//
//  ProfileScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla principal de perfil del usuario en la navegación de pestañas de inicio.
/// Equivalente en SwiftUI al composable `ProfileScreen` de Jetpack Compose (`ui.screen.home.tabs`).
@MainActor
public struct ProfileScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var onSettingsTap: (() -> Void)?

    public init(onSettingsTap: (() -> Void)? = nil) {
        self.onSettingsTap = onSettingsTap
    }

    public var body: some View {
        ProfileSessionStartedState(onSettingsTap: onSettingsTap)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    ProfileScreen()
        .environment(NavigationRouter())
}
