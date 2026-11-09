import SwiftUI
import Observation

/// Gestor de navegación centralizado para la aplicación.
/// Permite navegación declarativa y programática (push, pop, popToRoot).
@Observable
@MainActor
public final class NavigationRouter {
    public var path: [AppDestination] = []

    public init(path: [AppDestination] = []) {
        self.path = path
    }

    /// Navega a un nuevo destino (push).
    public func navigate(to destination: AppDestination) {
        path.append(destination)
    }

    /// Regresa a la pantalla anterior (pop).
    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    /// Regresa a la pantalla raíz eliminando todo el historial.
    public func popToRoot() {
        path.removeAll()
    }
}
