//
//  HomeTabs.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import Foundation

/// Tipos de usuario en la aplicación Roomie.
/// Equivalente en Swift al enum `UserType` (`data.models`).
public enum UserType: String, CaseIterable, Sendable {
    case unregistered = "UNREGISTERED"
    case registered = "REGISTERED"
    case tenant = "TENANT"
    case leaseholder = "LEASEHOLDER"

    // Compatibilidad en mayúsculas con Kotlin
    public static let UNREGISTERED = UserType.unregistered
    public static let REGISTERED = UserType.registered
    public static let TENANT = UserType.tenant
    public static let LEASEHOLDER = UserType.leaseholder
}

/// Elemento representativo de una pestaña de navegación en la barra inferior.
public struct HomeTabItem: Identifiable, Hashable, Sendable {
    public let id: Int
    public let text: String
    public let iconName: String

    public init(id: Int, text: String, iconName: String) {
        self.id = id
        self.text = text
        self.iconName = iconName
    }
}

/// Pestañas de navegación para usuarios no registrados.
public enum HomeTabsUnregistered: Int, CaseIterable, Sendable {
    case explore = 0
    case profile = 1

    public var id: Int { rawValue }

    public var item: HomeTabItem {
        switch self {
        case .explore:
            return HomeTabItem(id: rawValue, text: "Explorar", iconName: "map")
        case .profile:
            return HomeTabItem(id: rawValue, text: "Profile", iconName: "person")
        }
    }

    public static func asList() -> [HomeTabItem] {
        allCases.map { $0.item }
    }
}

/// Pestañas de navegación para usuarios registrados.
public enum HomeTabsRegistered: Int, CaseIterable, Sendable {
    case explore = 0
    case chats = 1
    case notifications = 2
    case profile = 3

    public var id: Int { rawValue }

    public var item: HomeTabItem {
        switch self {
        case .explore:
            return HomeTabItem(id: rawValue, text: "Explorar", iconName: "map")
        case .chats:
            return HomeTabItem(id: rawValue, text: "Chats", iconName: "message")
        case .notifications:
            return HomeTabItem(id: rawValue, text: "Notifications", iconName: "bell")
        case .profile:
            return HomeTabItem(id: rawValue, text: "Profile", iconName: "person")
        }
    }

    public static func asList() -> [HomeTabItem] {
        allCases.map { $0.item }
    }
}

/// Pestañas de navegación para inquilinos y propietarios.
public enum HomeTabsTenantLeaseholder: Int, CaseIterable, Sendable {
    case home = 0
    case payments = 1
    case planner = 2
    case roomies = 3
    case profile = 4

    public var id: Int { rawValue }

    public var item: HomeTabItem {
        switch self {
        case .home:
            return HomeTabItem(id: rawValue, text: "Inicio", iconName: "house")
        case .payments:
            return HomeTabItem(id: rawValue, text: "Pagos", iconName: "creditcard")
        case .planner:
            return HomeTabItem(id: rawValue, text: "Agenda", iconName: "calendar.day")
        case .roomies:
            return HomeTabItem(id: rawValue, text: "Roomies", iconName: "person.3")
        case .profile:
            return HomeTabItem(id: rawValue, text: "Profile", iconName: "person")
        }
    }

    public static func asList() -> [HomeTabItem] {
        allCases.map { $0.item }
    }
}

/// Tipo de usuario actual en sesión (valor por defecto inicial).
public var currentUserType: UserType = .tenant
