//
//  LocationError.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation

/// Errores tipados para el servicio de ubicación y geocodificación.
public enum LocationError: LocalizedError, Equatable, Sendable {
    case servicesDisabled
    case permissionDenied
    case emptyAddress
    case geocodingFailed(String)
    case unableToFindLocation(String)
    case timeout

    public var errorDescription: String? {
        switch self {
        case .servicesDisabled:
            return "Los servicios de ubicación del dispositivo están desactivados en Ajustes."
        case .permissionDenied:
            return "No se otorgaron permisos para acceder a la ubicación precisa de la app."
        case .emptyAddress:
            return "La dirección proporcionada para geocodificar está vacía."
        case .geocodingFailed(let reason):
            return "No fue posible encontrar coordenadas para la dirección indicada: \(reason)"
        case .unableToFindLocation(let reason):
            return "Error al intentar obtener la ubicación actual: \(reason)"
        case .timeout:
            return "Se agotó el tiempo de espera al intentar obtener la ubicación precisa."
        }
    }

    /// Determina si el error amerita presentar una alerta que redirija a Ajustes de iOS.
    public var requiresSettingsRedirect: Bool {
        switch self {
        case .servicesDisabled, .permissionDenied:
            return true
        default:
            return false
        }
    }
}
