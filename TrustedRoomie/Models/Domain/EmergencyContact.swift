//
//  EmergencyContact.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Entidad de contacto de emergencia correspondiente a la tabla `emergency_contacts` en Supabase.
nonisolated public struct EmergencyContact: Codable, Identifiable, Hashable, Sendable {
    public var id: String?
    public var userId: String?
    public var name: String?
    public var relation: String?
    public var phone: String?
    public var createdAt: String?
    public var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case name
        case relation
        case phone
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    public init(
        id: String? = nil,
        userId: String? = nil,
        name: String? = nil,
        relation: String? = nil,
        phone: String? = nil,
        createdAt: String? = nil,
        updatedAt: String? = nil
    ) {
        self.id = id
        self.userId = userId
        self.name = name
        self.relation = relation
        self.phone = phone
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
