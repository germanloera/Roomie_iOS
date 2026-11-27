//
//  L10n.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/27/26.
//

import Foundation
import SwiftUI

/// Representación unificada de texto para componentes UI que soporta claves localizadas literales y strings directos sin boilerplate.
public struct LocalizedText: ExpressibleByStringLiteral, Sendable {
    public let key: LocalizedStringKey?
    public let raw: String?
    public let isEmpty: Bool

    public init(stringLiteral value: String) {
        if value.isEmpty {
            self.key = nil
            self.raw = ""
            self.isEmpty = true
        } else {
            self.key = LocalizedStringKey(value)
            self.raw = value
            self.isEmpty = false
        }
    }

    public init(_ key: LocalizedStringKey) {
        self.key = key
        self.raw = nil
        self.isEmpty = false
    }

    public init(_ raw: String) {
        if raw.isEmpty {
            self.key = nil
            self.raw = ""
            self.isEmpty = true
        } else {
            self.key = LocalizedStringKey(raw)
            self.raw = raw
            self.isEmpty = false
        }
    }

    public init(verbatim: String) {
        self.key = nil
        self.raw = verbatim
        self.isEmpty = verbatim.isEmpty
    }

    public var text: Text {
        if let key {
            return Text(key)
        } else if let raw {
            return Text(verbatim: raw)
        } else {
            return Text("")
        }
    }
}

/// Utilidad y espacio de nombres tipado para la localización en la aplicación.
public enum L10n {
    /// Resuelve una clave localizada en un `String` estándar para su uso en APIs que requieren texto dinámico o alerts.
    public static func string(_ key: String, defaultValue: String? = nil) -> String {
        Bundle.main.localizedString(forKey: key, value: defaultValue, table: nil)
    }

    // MARK: - Validaciones Dinámicas
    public enum Validation {
        public static func notEmpty() -> String {
            string("validation.not_empty", defaultValue: "Este campo no puede estar vacío")
        }

        public static func minLength(_ min: Int) -> String {
            String(localized: "validation.min_length \(min)")
        }

        public static func maxLength(_ max: Int) -> String {
            String(localized: "validation.max_length \(max)")
        }

        public static func emailInvalid() -> String {
            string("validation.email_invalid", defaultValue: "El formato de correo no es válido")
        }

        public static func passwordsDoNotMatch() -> String {
            string("validation.passwords_do_not_match", defaultValue: "Las contraseñas no coinciden")
        }
    }

    // MARK: - Permisos Dinámicos
    public enum Permissions {
        public static func alertTitle(_ permission: String) -> String {
            String(localized: "permissions.alert_title \(permission)")
        }
    }

    // MARK: - Listados y Propiedades
    public enum Listing {
        public static func pricePerMonth(_ price: String) -> String {
            String(localized: "listing.price_per_month \(price)")
        }

        public static func bedroomsCount(_ count: Int) -> String {
            String(localized: "listing.bedrooms_count \(count)")
        }

        public static func bathroomsCount(_ count: Int) -> String {
            String(localized: "listing.bathrooms_count \(count)")
        }
    }
}
