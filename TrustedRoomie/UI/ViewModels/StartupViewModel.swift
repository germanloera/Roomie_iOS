//
//  StartupViewModel.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import Foundation
import Observation
import SwiftUI
import Combine



/// ViewModel encargado de coordinar el arranque de la aplicación, el estado de Supabase,
/// la sesión reactiva del usuario y la orquestación de permisos y ubicación.
/// Equivalente en SwiftUI a `StartupViewModel` de Jetpack Compose (`ui.vm`).
@Observable
@MainActor
public final class StartupViewModel {
    public var state: SupabaseState = .initializing
    public var session: UserSession = .loading
    public var isLoading: Bool = false
    public var errorMessage: String? = nil
    public var userRole : UserRole = .new
    public var user: User = User()

    public let supabaseRepository: any SupabaseRepositoryProtocol
    public let authRepository: any AuthRepository
    public let permissionManager: PermissionManager
    public let locationRepository: LocationRepository

    @ObservationIgnored private let sessionTaskHolder = TaskHolder()
    @ObservationIgnored private let stateTaskHolder = TaskHolder()

    public init(
        supabaseRepository: any SupabaseRepositoryProtocol = SupabaseRepository.shared,
        authRepository: any AuthRepository = AuthRepositoryImpl.shared,
        permissionManager: PermissionManager? = nil,
        locationRepository: LocationRepository? = nil
    ) {
        self.supabaseRepository = supabaseRepository
        self.authRepository = authRepository
        self.permissionManager = permissionManager ?? .shared
        self.locationRepository = locationRepository ?? .shared

        startObserving()
    }

    public convenience init(
        repository: any SupabaseRepositoryProtocol = SupabaseRepository.shared,
        auth: any AuthRepository = AuthRepositoryImpl.shared,
        permissionManager: PermissionManager? = nil,
        locationRepository: LocationRepository? = nil
    ) {
        self.init(
            supabaseRepository: repository,
            authRepository: auth,
            permissionManager: permissionManager,
            locationRepository: locationRepository
        )
    }

    private func startObserving() {
        stateTaskHolder.cancel()
        stateTaskHolder.task = Task { [weak self] in
            guard let self else { return }
            for await newState in self.supabaseRepository.provider.states {
                if Task.isCancelled { break }
                self.state = newState
            }
        }

        sessionTaskHolder.cancel()
        sessionTaskHolder.task = Task { [weak self] in
            guard let self else { return }
            for await newSession in self.authRepository.session {
                if Task.isCancelled { break }
                self.session = newSession
                
                
                switch self.session{
                case .authenticated(_, _, let userData):
                    self.user = userData
                    self.userRole = userData.role
                    
                default:
                   
                    self.userRole = .new
                    
             
                }
                
                
            }
        }
    }

    /// Reintenta inicializar la conexión con Supabase.
    public func retry() {
        isLoading = true
        errorMessage = nil
        Task {
            let resultState = await supabaseRepository.provider.initialize()
            self.state = resultState
            self.isLoading = false
        }
    }

    /// Dispara el inicio del rastreo automático de ubicación una vez concedidos los permisos.
    public func onLocationPermissionGranted() {
        Task {
            await locationRepository.startAutoTrackingIfAuthorized()
        }
    }

    /// Cierra la sesión activa a través de AuthRepository.
    public func signOut() async throws {
        try await authRepository.signOut()
    }

    deinit {
        sessionTaskHolder.cancel()
        stateTaskHolder.cancel()
    }
}
