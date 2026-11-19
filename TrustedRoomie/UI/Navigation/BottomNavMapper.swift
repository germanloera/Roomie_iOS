//
//  BottomNavMapper.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import Foundation

/**
 * Mapeo entre el índice de la [HomeNavigationBar] y el [AppDestinations] correspondiente.
 *
 * Mantener este orden sincronizado con [unregisteredUser] en HomeNavigationBar.kt.
 * Equivalente en SwiftUI a `BottomNavMapper.kt` de Jetpack Compose (`ui.navigation`).
 */
public let bottomNavDestinations: [AppDestinations] = [
    .Explore,
    .Profile,
    .Login
]

/** Convierte un índice de bottom-bar a su ruta de navegación. */
public func indexToRoute(index: Int) -> String {
    if index >= 0 && index < bottomNavDestinations.count {
        return bottomNavDestinations[index].route
    }
    return AppDestinations.Explore.route
}

/** Convierte una ruta de navegación a su índice de bottom-bar. */
public func routeToIndex(route: String?) -> Int {
    guard let route else { return 0 }
    if let foundIndex = bottomNavDestinations.firstIndex(where: { $0.route == route }) {
        return max(foundIndex, 0)
    }
    return 0
}
