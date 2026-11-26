//
//  StartupPermissionsHandler.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import SwiftUI

/// Modificador de vista que gestiona la verificación y solicitud asíncrona no intrusiva
/// de permisos al arrancar la app, y sincroniza la ubicación tan pronto como esté autorizada.
public struct StartupPermissionsHandler: ViewModifier {
    private let permissionManager: PermissionManager
    private let locationRepository: LocationRepository

    public init(
        permissionManager: PermissionManager = .shared,
        locationRepository: LocationRepository = .shared
    ) {
        self.permissionManager = permissionManager
        self.locationRepository = locationRepository
    }

    public func body(content: Content) -> some View {
        content
            .task {
                // Ejecución en segundo plano sin interrumpir ni bloquear la interacción del usuario
                await permissionManager.requestStartupPermissions()

                // Si la ubicación fue autorizada, disparar actualización inicial automática
                await locationRepository.startAutoTrackingIfAuthorized()
            }
    }
}

public extension View {
    /// Inicia la orquestación de permisos al arranque de forma transparente y reactiva.
    func handleStartupPermissions(
        permissionManager: PermissionManager = .shared,
        locationRepository: LocationRepository = .shared
    ) -> some View {
        self.modifier(
            StartupPermissionsHandler(
                permissionManager: permissionManager,
                locationRepository: locationRepository
            )
        )
    }
}
