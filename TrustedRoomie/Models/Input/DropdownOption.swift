//
//  DropdownOption.swift
//  TrustedRoomie
//
//  Created by Antigravity on 11/26/26.
//

import Foundation

/// Modelo genérico que representa una opción seleccionable dentro de un componente `DropdownInput`.
public struct DropdownOption<T: Hashable & Sendable>: Identifiable, Equatable, Hashable, Sendable {
    public let id: String
    public let value: T
    public let label: String

    public init(id: String = UUID().uuidString, value: T, label: String) {
        self.id = id
        self.value = value
        self.label = label
    }

    public static func == (lhs: DropdownOption<T>, rhs: DropdownOption<T>) -> Bool {
        lhs.id == rhs.id && lhs.value == rhs.value && lhs.label == rhs.label
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(value)
    }
}
