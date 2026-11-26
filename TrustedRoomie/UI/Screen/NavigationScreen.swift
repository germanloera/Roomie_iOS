//
//  NavigationScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

/// Pantalla raíz de navegación de la aplicación que aloja el NavHost principal.
/// Equivalente en SwiftUI al composable `NavigationScreen` de Jetpack Compose (`ui.screen`).
public struct NavigationScreen: View {
    public init() {}

    public var body: some View {
        AppNavHost()
            .handleStartupPermissions()
    }
}

#Preview {
    NavigationScreen()
}
