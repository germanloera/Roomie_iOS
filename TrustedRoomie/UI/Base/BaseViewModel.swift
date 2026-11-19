//
//  BaseViewModel.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import Foundation
import Observation

/// Estado genérico de UI para operaciones asíncronas.
/// Equivalente en Swift a `UiState<T>` de Jetpack Compose (`ui.base`).
public enum UiState<T> {
    case idle
    case loading
    case success(T)
    case error(String)
}

extension UiState: Equatable where T: Equatable {}

/// Eventos comunes de UI de un solo disparo (side effects).
/// Equivalente en Swift a `UiEvent` de Jetpack Compose (`ui.base`).
public enum UiEvent: Equatable, Sendable {
    case showSnackbar(String)
    case navigate(String)
}

/// ViewModel base observable para gestionar el estado de UI y eventos en SwiftUI.
/// Equivalente a `BaseViewModel<S, E>` de Jetpack Compose (`ui.base`).
@Observable
@MainActor
open class BaseViewModel<S, E> {
    public var uiState: S
    public var uiEvent: E?

    public init(initialState: S) {
        self.uiState = initialState
        self.uiEvent = nil
    }

    /// Actualiza el estado actual mediante una mutación inout.
    public func updateState(_ update: (inout S) -> Void) {
        update(&uiState)
    }

    /// Reemplaza el estado actual completamente.
    public func updateState(_ newState: S) {
        uiState = newState
    }

    /// Emite un evento de UI para ser consumido por la vista.
    public func sendEvent(_ event: E) {
        uiEvent = event
    }

    /// Limpia el evento una vez consumido por la vista.
    public func clearEvent() {
        uiEvent = nil
    }
}
