import SwiftUI
import Observation

/// Gestor de navegación centralizado para la aplicación.
/// Permite navegación declarativa y programática (push, pop, popToRoot).
@Observable
@MainActor
public final class NavigationRouter {
    public var path = NavigationPath()

    public init(path: NavigationPath = NavigationPath()) {
        self.path = path
    }

    /// Navega a un nuevo destino (push).
    public func navigate<R: Hashable>(to destination: R) {
        path.append(destination)
    }

    /// Regresa a la pantalla anterior (pop).
    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    /// Regresa múltiples pantallas hacia atrás.
    public func popBack(count: Int) {
        for _ in 0..<count {
            guard !path.isEmpty else { break }
            path.removeLast()
        }
    }

    /// Regresa a la pantalla raíz eliminando todo el historial.
    public func popToRoot() {
        path = NavigationPath()
    }
}
