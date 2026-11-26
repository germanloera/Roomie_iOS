//
//  FlagsmithService.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation
import FlagsmithClient

/// Contrato para el servicio de obtención de feature flags y configuración remota.
public protocol FlagsmithService: Sendable {
    /// Inicializa la configuración de Flagsmith si fuera necesario.
    func initialize() async
    /// Retorna el valor de un flag remoto como String de forma asíncrona.
    func getString(_ key: String) async throws -> String?
}

/// Implementación del servicio utilizando el SDK oficial FlagsmithClient.
public final class FlagsmithServiceImpl: FlagsmithService, @unchecked Sendable {
    public static let shared = FlagsmithServiceImpl()

    private let environmentKey: String
    private let environmentUrl: String

    public nonisolated init(
        environmentKey: String = AppRemoteConfigConstants.flagsmithEnvironmentKey,
        environmentUrl: String = AppRemoteConfigConstants.flagsmithBaseURL
    ) {
        self.environmentKey = environmentKey
        self.environmentUrl = environmentUrl
    }

    public func initialize() async {
        if !environmentKey.isEmpty {
            Flagsmith.shared.apiKey = environmentKey
        }
        if !environmentUrl.isEmpty, let url = URL(string: environmentUrl) {
            Flagsmith.shared.baseURL = url
        }
    }

    public func getString(_ key: String) async throws -> String? {
        await initialize()

        return try await withCheckedThrowingContinuation { continuation in
            Flagsmith.shared.getValueForFeature(withID: key) { result in
                switch result {
                case .success(let typedValue):
                    if let value = typedValue, value != .null {
                        continuation.resume(returning: value.stringValue)
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
