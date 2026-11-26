//
//  User.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Entidad de usuario correspondiente a la tabla `users` en Supabase.
nonisolated public struct User: Codable, Identifiable, Hashable, Sendable {
    public var id: String
    public var email: String
    public var passwordHash: String?
    public var name: String
    public var nickname: String?
    public var phone: String?
    public var role: UserRole
    public var verified: Bool
    public var contactVisible: Bool
    public var pushNotificationsEnabled: Bool
    public var emailNotificationsEnabled: Bool
    public var createdAt: String
    public var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case passwordHash = "password_hash"
        case name
        case nickname
        case phone
        case role
        case verified
        case contactVisible = "contact_visible"
        case pushNotificationsEnabled = "push_notifications_enabled"
        case emailNotificationsEnabled = "email_notifications_enabled"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    public init(
        id: String = "",
        email: String = "",
        passwordHash: String? = nil,
        name: String = "",
        nickname: String? = nil,
        phone: String? = nil,
        role: UserRole = .new,
        verified: Bool = false,
        contactVisible: Bool = false,
        pushNotificationsEnabled: Bool = true,
        emailNotificationsEnabled: Bool = true,
        createdAt: String = "",
        updatedAt: String = ""
    ) {
        self.id = id
        self.email = email
        self.passwordHash = passwordHash
        self.name = name
        self.nickname = nickname
        self.phone = phone
        self.role = role
        self.verified = verified
        self.contactVisible = contactVisible
        self.pushNotificationsEnabled = pushNotificationsEnabled
        self.emailNotificationsEnabled = emailNotificationsEnabled
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
