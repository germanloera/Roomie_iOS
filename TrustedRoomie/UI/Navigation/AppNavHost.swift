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
 * Inyecta las instancias observables de permisos, ubicación y selector de archivos en el environment.
 */
public struct AppNavHost: View {
    @State private var router = NavigationRouter()

    public var body: some View {
        NavigationStack(path: $router.path) {
            HomeScreen()
                .HomeGraph()
                .LoginGraph()
               // .ListingGraph()
                .SettingsGraph()
        }
        .BottomSheetGraph()
        .environment(router)
        .environment(PermissionManager.shared)
        .environment(LocationRepository.shared)
        .environment(FilePickerRepository.shared)
    }
}

#Preview {
    AppNavHost()
}
