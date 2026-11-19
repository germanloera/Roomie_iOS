//
//  AppNavHost.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/**
 * NavHost principal de la aplicación.
 *
 * Configura la pila de navegación raíz y registra los grafos `HomeGraph`, `LoginGraph` y `SettingsGraph`.
 * Equivalente en SwiftUI a `AppNavHost` de Jetpack Compose (`ui.navigation`).
 */
public struct AppNavHost: View {
    @State private var router = NavigationRouter()


    public var body: some View {
        NavigationStack(path: $router.path) {
            HomeScreen()
                .HomeGraph()
                .LoginGraph()
                .ListingGraph()
                .SettingsGraph()
        }
        .BottomSheetGraph()
        .environment(router)
       
    }
}

#Preview {
    AppNavHost()
}
