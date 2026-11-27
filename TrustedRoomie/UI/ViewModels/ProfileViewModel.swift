//
//  ProfileViewModel.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import Foundation
import Observation
import SwiftUI
import Combine

/// Estado de UI para la pantalla de perfil.
/// Equivalente en Swift a `ProfileUIState` (`ui.vm`).
public struct ProfileUIState: Equatable, Sendable {
    public var initials: String
    public var user: User
    public var emergencyContact: [EmergencyContact]
    public var isLoading: Bool
    public var errorMessage: String?

    public init(
        initials: String = "",
        user: User = User(id: "", email: "", name: ""),
        emergencyContact: [EmergencyContact] = [],
        isLoading: Bool = false,
        errorMessage: String? = nil
    ) {
        self.initials = initials
        self.user = user
        self.emergencyContact = emergencyContact
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
}

/// ViewModel para la gestión del perfil de usuario, información de contacto de emergencia
/// y persistencia con SupabaseRepository y AuthRepository.
/// Equivalente en SwiftUI a `ProfileViewModel` de Jetpack Compose (`ui.vm`).
@Observable
@MainActor
public final class ProfileViewModel {
    public var uiState: ProfileUIState = ProfileUIState()

    // MARK: - Propiedades de conveniencia directa para SwiftUI

    public var user: User {
        get { uiState.user }
        set { uiState.user = newValue }
    }

    public var initials: String {
        get { uiState.initials }
        set { uiState.initials = newValue }
    }

    public var emergencyContact: [EmergencyContact] {
        get { uiState.emergencyContact }
        set { uiState.emergencyContact = newValue }
    }

    public var isLoading: Bool {
        get { uiState.isLoading }
        set { uiState.isLoading = newValue }
    }

    public var errorMessage: String? {
        get { uiState.errorMessage }
        set { uiState.errorMessage = newValue }
    }

    private let supabaseRepository: any SupabaseRepositoryProtocol
    private let authRepository: any AuthRepository
    @ObservationIgnored private let sessionTaskHolder = TaskHolder()

    public init(
        supabaseRepository: any SupabaseRepositoryProtocol = SupabaseRepository.shared,
        authRepository: any AuthRepository = AuthRepositoryImpl.shared
    ) {
        self.supabaseRepository = supabaseRepository
        self.authRepository = authRepository

        startObservingSession()
    }

    public convenience init(
        repository: any SupabaseRepositoryProtocol = SupabaseRepository.shared,
        auth: any AuthRepository = AuthRepositoryImpl.shared
    ) {
        self.init(supabaseRepository: repository, authRepository: auth)
    }

    private func startObservingSession() {
        sessionTaskHolder.cancel()
        sessionTaskHolder.task = Task { [weak self] in
            guard let self else { return }
            for await session in self.authRepository.session {
                if Task.isCancelled { break }
                if case .authenticated(_, _, let userData) = session {
                    self.setUserDisplayName(userData)
                }
            }
        }
    }

    /// Actualiza los datos del usuario y recalcula las iniciales.
    public func setUserDisplayName(_ user: User) {
        uiState.user = user
        uiState.initials = user.name.initials()
    }

    public func setName(_ name: String) {
        uiState.initials = name.initials()
        uiState.user.name = name
    }

    public func setNickname(_ nickname: String) {
        uiState.user.nickname = nickname
    }

    public func setPhone(_ phone: String) {
        uiState.user.phone = phone
    }

    public func setEmail(_ email: String) {
        uiState.user.email = email
    }

    /// Refresca los datos del usuario actual y sus contactos de emergencia desde Supabase.
    public func refreshUser() async {
        uiState.isLoading = true
        uiState.errorMessage = nil
        defer { uiState.isLoading = false }

        do {
            let updatedData = try await supabaseRepository.getCurrentUserData()
            let contacts = try await supabaseRepository.getEmergencyContacts(userId: updatedData.id)
            uiState.user = updatedData
            uiState.initials = updatedData.name.initials()
            uiState.emergencyContact = contacts
        } catch {
            uiState.errorMessage = error.localizedDescription
        }
    }

    /// Guarda los datos personales del usuario y los contactos de emergencia en Supabase.
    public func save(onSuccess: (() -> Void)? = nil) async {
        uiState.isLoading = true
        uiState.errorMessage = nil
        defer { uiState.isLoading = false }

        do {
            try await supabaseRepository.updateUserData(uiState.user)
            try await supabaseRepository.updateEmergencyContact(uiState.emergencyContact)
            await refreshUser()
            onSuccess?()
        } catch {
            uiState.errorMessage = error.localizedDescription
        }
    }

    /// Actualiza ambos contactos de emergencia asociándolos al `id` del usuario en sesión.
    public func updateEmergencyContacts(contact1: EmergencyContact, contact2: EmergencyContact) {
        var c1 = contact1
        c1.userId = uiState.user.id
        var c2 = contact2
        c2.userId = uiState.user.id
        uiState.emergencyContact = [c1, c2]
    }

    /// Cierra la sesión activa a través de AuthRepository.
    public func signOut() async throws {
        try await authRepository.signOut()
    }

    deinit {
        sessionTaskHolder.cancel()
    }
}
