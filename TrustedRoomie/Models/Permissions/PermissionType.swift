//
//  PermissionType.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation

/// Tipos de permisos clave gestionados por la aplicación.
public enum PermissionType: String, CaseIterable, Identifiable, Sendable, Hashable {
    case notifications
    case locationWhenInUse
    case photoLibrary

    public var id: String { rawValue }

    /// Título descriptivo para la interfaz de usuario.
    public var title: String {
        switch self {
        case .notifications:
            return L10n.string("permissions.notifications.title", defaultValue: "Notificaciones")
        case .locationWhenInUse:
            return L10n.string("permissions.location.title", defaultValue: "Ubicación precisa")
        case .photoLibrary:
            return L10n.string("permissions.photos.title", defaultValue: "Acceso a Fotos")
        }
    }

    /// Razón explicativa de por qué la app requiere este permiso.
    public var rationaleDescription: String {
        switch self {
        case .notifications:
            return L10n.string("permissions.notifications.rationale", defaultValue: "Te avisaremos de solicitudes de roomies, mensajes nuevos y recordatorios de pagos importantes.")
        case .locationWhenInUse:
            return L10n.string("permissions.location.rationale", defaultValue: "Permite mostrarte departamentos disponibles y encontrar potenciales compañeros cerca de tu zona.")
        case .photoLibrary:
            return L10n.string("permissions.photos.rationale", defaultValue: "Necesario para subir fotos de los departamentos que publiques o actualizar tu foto de perfil.")
        }
    }

    /// Icono SF Symbol representativo del permiso.
    public var systemImage: String {
        switch self {
        case .notifications:
            return "bell.badge.fill"
        case .locationWhenInUse:
            return "location.fill"
        case .photoLibrary:
            return "photo.on.rectangle.angled"
        }
    }
}
