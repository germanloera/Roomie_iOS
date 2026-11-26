//
//  AuthRepository.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation
import Combine

/// Contrato para el repositorio de autenticación y sesión de usuario.
public protocol AuthRepository: Sendable {
    /// Flujo reactivo con el estado actual de la sesión del usuario.
    var session: AsyncStream<UserSession> { get }

    /// Publisher Combine para suscripciones reactivas en SwiftUI o ViewModel.
    var sessionPublisher: AnyPublisher<UserSession, Never> { get }

    /// Registra un nuevo usuario con email, contraseña y nombre en los metadatos.
    func signUp(email: String, password: String, name: String) async -> AuthResult

    /// Inicia sesión con correo y contraseña.
    func signIn(email: String, password: String) async -> AuthResult

    /// Cierra la sesión activa en Supabase.
    func signOut() async throws
}
