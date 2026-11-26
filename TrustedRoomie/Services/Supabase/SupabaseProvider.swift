//
//  SupabaseProvider.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation
import Combine
import Supabase

/// Proveedor central de Supabase en iOS con inicialización asíncrona, sincronización
/// contra llamadas concurrentes y estado observable.
public actor SupabaseProvider {
    public static let shared = SupabaseProvider()

    private let configProvider: any SupabaseConfigProvider

    private var _state: SupabaseState = .initializing
    public var state: SupabaseState {
        _state
    }

    private var client: SupabaseClient?
    private var ongoingInitTask: Task<SupabaseClient, any Error>?
    private var clientWaiters: [CheckedContinuation<SupabaseClient, Never>] = []

    nonisolated private let stateSubject = CurrentValueSubject<SupabaseState, Never>(.initializing)

    /// Publisher Combine para observar el estado del proveedor.
    public nonisolated var statePublisher: AnyPublisher<SupabaseState, Never> {
        stateSubject.eraseToAnyPublisher()
    }

    /// Flujo reactivo AsyncStream para observar transiciones de estado mediante Swift Concurrency.
    public nonisolated var states: AsyncStream<SupabaseState> {
        AsyncStream { continuation in
            let cancellable = stateSubject.sink { state in
                continuation.yield(state)
            }
            continuation.onTermination = { _ in
                cancellable.cancel()
            }
        }
    }

    public init(configProvider: any SupabaseConfigProvider = FlagsmithConfigProvider()) {
        self.configProvider = configProvider
    }

    /// Inicializa la conexión con Supabase en background de forma idempotente y segura para hilos.
    @discardableResult
    public func initialize() async -> SupabaseState {
        // Si ya hay una tarea de inicialización en curso, esperamos su resultado
        if let ongoing = ongoingInitTask {
            _ = try? await ongoing.value
            return _state
        }

        // Si ya está listo y tiene cliente, no se reinicializa
        if let _ = client, case .ready = _state {
            return .ready
        }

        _state = .initializing
        stateSubject.send(.initializing)

        let initTask = Task<SupabaseClient, any Error> {
            let config = try await self.configProvider.getConfig()
            guard let url = URL(string: config.url) else {
                throw URLError(.badURL)
            }

            let newClient = SupabaseClient(
                supabaseURL: url,
                supabaseKey: config.key
            )
            return newClient
        }
        self.ongoingInitTask = initTask

        do {
            let newClient = try await initTask.value
            self.client = newClient
            self._state = .ready
            self.stateSubject.send(.ready)
            self.ongoingInitTask = nil

            // Despierta a todos los suspendidos que esperaban por el cliente
            let waiters = self.clientWaiters
            self.clientWaiters.removeAll()
            for waiter in waiters {
                waiter.resume(returning: newClient)
            }

            return .ready
        } catch {
            self.client = nil
            self._state = .error(error)
            self.stateSubject.send(.error(error))
            self.ongoingInitTask = nil
            return .error(error)
        }
    }

    /// Suspende la ejecución hasta que el cliente esté completamente inicializado y en estado Ready.
    public func awaitClient() async -> SupabaseClient {
        if let client = self.client, case .ready = _state {
            return client
        }

        // Si la inicialización no ha comenzado, la disparamos
        if ongoingInitTask == nil {
            Task {
                await self.initialize()
            }
        }

        return await withCheckedContinuation { continuation in
            if let client = self.client, case .ready = _state {
                continuation.resume(returning: client)
            } else {
                self.clientWaiters.append(continuation)
            }
        }
    }
}
