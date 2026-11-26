//
//  PermissionStatus.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation

/// Estado de autorización reactivo para cada permiso de la app.
public enum PermissionStatus: String, Sendable, Hashable, Codable {
    case notDetermined
    case authorized
    case limited
    case denied
    case restricted

    /// Indica si el permiso otorga acceso funcional (completo o limitado en fotos).
    public var isAuthorized: Bool {
        self == .authorized || self == .limited
    }

    /// Indica si el sistema operativo aún permite presentar el diálogo nativo de solicitud.
    public var canRequestDirectly: Bool {
        self == .notDetermined
    }

    /// Indica si el permiso fue denegado permanentemente y requiere redirigir al usuario a Ajustes.
    public var requiresSettingsRedirect: Bool {
        self == .denied || self == .restricted
    }

    /// Nombre legible del estado para fines de depuración o UI.
    public var displayName: String {
        switch self {
        case .notDetermined:
            return "Pendiente"
        case .authorized:
            return "Autorizado"
        case .limited:
            return "Acceso Limitado"
        case .denied:
            return "Denegado"
        case .restricted:
            return "Restringido"
        }
    }
}
