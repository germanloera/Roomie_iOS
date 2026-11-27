//
//  InputRestriction.swift
//  TrustedRoomie
//
//  Created by Antigravity on 11/26/26.
//

import Foundation

/// Representa una regla o restricción de validación para campos de entrada de texto.
public struct InputRestriction: Identifiable, Sendable {
    public let id: String
    public let errorMessage: String
    public let validator: @Sendable (String) -> Bool

    public init(
        id: String,
        errorMessage: String,
        validator: @escaping @Sendable (String) -> Bool
    ) {
        self.id = id
        self.errorMessage = errorMessage
        self.validator = validator
    }

    // MARK: - Catálogo de Reglas Predefinidas

    /// Exige que el campo no esté vacío (ignorando espacios en blanco y saltos de línea).
    public static func notEmpty(
        message: String? = nil,
        id: String = "notEmpty"
    ) -> InputRestriction {
        let msg = message ?? L10n.Validation.notEmpty()
        return InputRestriction(id: id, errorMessage: msg) { text in
            !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }

    /// Exige una longitud mínima de caracteres.
    public static func minLength(
        min: Int,
        message: String? = nil,
        id: String = "minLength"
    ) -> InputRestriction {
        let msg = message ?? L10n.Validation.minLength(min)
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.count >= min
        }
    }

    /// Exige una longitud máxima de caracteres.
    public static func maxLength(
        max: Int,
        message: String? = nil,
        id: String = "maxLength"
    ) -> InputRestriction {
        let msg = message ?? L10n.Validation.maxLength(max)
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.count <= max
        }
    }

    /// Exige al menos una letra mayúscula.
    public static func hasUppercase(
        message: String? = nil,
        id: String = "hasUppercase"
    ) -> InputRestriction {
        let msg = message ?? L10n.string("validation.uppercase_required", defaultValue: "Debe contener al menos una letra mayúscula")
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.contains(where: { $0.isUppercase })
        }
    }

    /// Exige al menos una letra minúscula.
    public static func hasLowercase(
        message: String? = nil,
        id: String = "hasLowercase"
    ) -> InputRestriction {
        let msg = message ?? L10n.string("validation.lowercase_required", defaultValue: "Debe contener al menos una letra minúscula")
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.contains(where: { $0.isLowercase })
        }
    }

    /// Exige al menos un dígito numérico.
    public static func hasDigit(
        message: String? = nil,
        id: String = "hasDigit"
    ) -> InputRestriction {
        let msg = message ?? L10n.string("validation.digit_required", defaultValue: "Debe contener al menos un número")
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.contains(where: { $0.isNumber })
        }
    }

    /// Exige al menos un carácter especial (no alfanumérico ni espacio).
    public static func hasSpecialChar(
        message: String? = nil,
        id: String = "hasSpecialChar"
    ) -> InputRestriction {
        let msg = message ?? L10n.string("validation.special_char_required", defaultValue: "Debe contener al menos un carácter especial")
        return InputRestriction(id: id, errorMessage: msg) { text in
            text.contains(where: { !$0.isLetter && !$0.isNumber && !$0.isWhitespace })
        }
    }

    /// Exige que el contenido esté compuesto únicamente por dígitos numéricos.
    public static func onlyDigits(
        message: String? = nil,
        id: String = "onlyDigits"
    ) -> InputRestriction {
        let msg = message ?? L10n.string("validation.only_digits", defaultValue: "Solo debe contener dígitos")
        return InputRestriction(id: id, errorMessage: msg) { text in
            !text.isEmpty && text.allSatisfy { $0.isNumber }
        }
    }

    /// Valida que el texto tenga un formato de correo electrónico estándar.
    public static func email(
        message: String? = nil,
        id: String = "email"
    ) -> InputRestriction {
        let msg = message ?? L10n.Validation.emailInvalid()
        let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return regex(pattern: pattern, message: msg, id: id)
    }

    /// Valida que el texto cumpla con una expresión regular dada.
    public static func regex(
        pattern: String,
        message: String,
        id: String = "regex"
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message) { text in
            guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }
            let range = NSRange(location: 0, length: text.utf16.count)
            return regex.firstMatch(in: text, options: [], range: range) != nil
        }
    }

    /// Regla personalizada con closure evaluador.
    
    /// Regla personalizada con closure evaluador y parámetro `message`.
    public static func custom(
        id: String = UUID().uuidString,
        message: String,
        validator: @escaping @Sendable (String) -> Bool
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: message, validator: validator)
    }

    public static func custom(
        errorMessage: String,
        id: String = UUID().uuidString,
        validator: @escaping @Sendable (String) -> Bool
    ) -> InputRestriction {
        InputRestriction(id: id, errorMessage: errorMessage, validator: validator)
    }
}
