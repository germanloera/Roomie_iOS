//
//  UserSession.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Representa el estado reactivo de sesión del usuario en la aplicación.
nonisolated public enum UserSession: Sendable, Equatable {
    case loading
    case guest
    case authenticated(userId: String, email: String?, userData: User)
    case anonymous(userId: String)
    case error(message: String)
}
