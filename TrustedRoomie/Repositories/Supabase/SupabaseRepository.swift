//
//  SupabaseRepository.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Protocolo base para el repositorio de datos de Supabase.
public protocol SupabaseRepositoryProtocol: Sendable {
    var provider: SupabaseProvider { get }
}

/// Repositorio central que mantiene una referencia a SupabaseProvider
/// y expone operaciones de consulta y mutación mediante Postgrest.
nonisolated public final class SupabaseRepository: SupabaseRepositoryProtocol, @unchecked Sendable {
    nonisolated public static let shared = SupabaseRepository()

    public let provider: SupabaseProvider

    public nonisolated init(provider: SupabaseProvider = .shared) {
        self.provider = provider
    }
}
