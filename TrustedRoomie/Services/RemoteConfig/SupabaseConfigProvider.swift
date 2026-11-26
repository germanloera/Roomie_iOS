//
//  SupabaseConfigProvider.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Estructura que almacena la configuración de conexión con Supabase.
public struct SupabaseConfig: Sendable, Equatable {
    public let url: String
    public let key: String

    public init(url: String, key: String) {
        self.url = url
        self.key = key
    }
}

/// Errores posibles al resolver la configuración de Supabase desde Flagsmith.
public enum SupabaseConfigError: LocalizedError, Sendable {
    case missingSupabaseURL
    case missingSupabaseKey

    public var errorDescription: String? {
        switch self {
        case .missingSupabaseURL:
            return "SUPABASE_URL is missing in Flagsmith"
        case .missingSupabaseKey:
            return "SUPABASE_PUBLISHABLE_KEY is missing in Flagsmith"
        }
    }
}

/// Contrato para proveer la configuración de Supabase.
public protocol SupabaseConfigProvider: Sendable {
    func getConfig() async throws -> SupabaseConfig
}

/// Implementación que obtiene y valida las credenciales de Supabase mediante FlagsmithService.
public final class FlagsmithConfigProvider: SupabaseConfigProvider, @unchecked Sendable {
    private let flagsmithService: FlagsmithService

    public nonisolated init(flagsmithService: FlagsmithService = FlagsmithServiceImpl.shared) {
        self.flagsmithService = flagsmithService
    }

    public func getConfig() async throws -> SupabaseConfig {
        let rawUrl = try await flagsmithService.getString("url_supabase")
        guard let url = rawUrl?.trimmingCharacters(in: .whitespacesAndNewlines), !url.isEmpty else {
            throw SupabaseConfigError.missingSupabaseURL
        }

        let rawKey = try await flagsmithService.getString("supabase_key")
        guard let key = rawKey?.trimmingCharacters(in: .whitespacesAndNewlines), !key.isEmpty else {
            throw SupabaseConfigError.missingSupabaseKey
        }

        return SupabaseConfig(url: url, key: key)
    }
}
