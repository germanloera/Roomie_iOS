//
//  AuthRepositoryImpl.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation
@preconcurrency import Combine
import Supabase

nonisolated private final class CancellableHolder: @unchecked Sendable {
    var cancellable: AnyCancellable?
    nonisolated init(_ cancellable: AnyCancellable? = nil) {
        self.cancellable = cancellable
    }
    nonisolated func cancel() {
        cancellable?.cancel()
        cancellable = nil
    }
}

/// Implementación de AuthRepository utilizando supabase.auth.
nonisolated public final class AuthRepositoryImpl: AuthRepository, @unchecked Sendable {
    nonisolated public static let shared = AuthRepositoryImpl()

    private let supabase: SupabaseProvider
    private let repo: SupabaseRepository

    private let sessionSubject = CurrentValueSubject<UserSession, Never>(.loading)
    private var observationTask: Task<Void, Never>?

    public var sessionPublisher: AnyPublisher<UserSession, Never> {
        sessionSubject.eraseToAnyPublisher()
    }

    public var session: AsyncStream<UserSession> {
        AsyncStream { continuation in
            let holder = CancellableHolder()
            holder.cancellable = self.sessionSubject.sink { value in
                continuation.yield(value)
            }
            continuation.onTermination = { _ in
                holder.cancel()
            }
        }
    }

    public init(
        supabase: SupabaseProvider = .shared,
        repo: SupabaseRepository = .shared
    ) {
        self.supabase = supabase
        self.repo = repo
        startObservingSession()
    }

    private func startObservingSession() {
        observationTask = Task { [weak self] in
            guard let self else { return }
            self.sessionSubject.send(.loading)

            let client = await self.supabase.awaitClient()

            for await (_, session) in client.auth.authStateChanges {
                guard let session else {
                    self.sessionSubject.send(.guest)
                    continue
                }

                let user = session.user
                if user.isAnonymous {
                    self.sessionSubject.send(.anonymous(userId: user.id.uuidString))
                } else {
                    do {
                        let currentUser = try await self.repo.getCurrentUserData()
                        self.sessionSubject.send(.authenticated(
                            userId: user.id.uuidString,
                            email: user.email,
                            userData: currentUser
                        ))
                    } catch {
                        let fallbackUser = User(
                            id: user.id.uuidString,
                            email: user.email ?? ""
                        )
                        self.sessionSubject.send(.authenticated(
                            userId: user.id.uuidString,
                            email: user.email,
                            userData: fallbackUser
                        ))
                    }
                }
            }
        }
    }

    public func signUp(
        email: String,
        password: String,
        name: String
    ) async -> AuthResult {
        do {
            let client = await supabase.awaitClient()
            _ = try await client.auth.signUp(
                email: email,
                password: password,
                data: [
                    "app": .string("roomies"),
                    "name": .string(name)
                ]
            )
            return .success
        } catch is CancellationError {
            return .error(message: "Operación cancelada")
        } catch {
            return .error(message: error.localizedDescription)
        }
    }

    public func signIn(
        email: String,
        password: String
    ) async -> AuthResult {
        do {
            let client = await supabase.awaitClient()
            _ = try await client.auth.signIn(
                email: email,
                password: password
            )
            return .success
        } catch is CancellationError {
            return .error(message: "Operación cancelada")
        } catch {
            return .error(message: error.localizedDescription)
        }
    }

    public func signOut() async throws {
        let client = await supabase.awaitClient()
        try await client.auth.signOut()
    }

    deinit {
        observationTask?.cancel()
    }
}
