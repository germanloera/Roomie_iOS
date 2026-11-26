//
//  AuthResult.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Resultado de las operaciones de autenticación (signUp y signIn).
nonisolated public enum AuthResult: Sendable, Equatable {
    case success
    case error(message: String)
}
