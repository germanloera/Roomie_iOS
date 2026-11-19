import SwiftUI
import Observation

/// Gestor de navegación centralizado para la aplicación.
/// Permite navegación declarativa y programática (push, pop, popToRoot, presentBottomSheet, dismissBottomSheet).
@Observable
@MainActor
public final class NavigationRouter {
    public var path = NavigationPath()

    /// BottomSheet activo actualmente presentado de manera global por el router.
    public var activeBottomSheet: BottomSheetRoute?

    public init(
        path: NavigationPath = NavigationPath(),
        activeBottomSheet: BottomSheetRoute? = nil
    ) {
        self.path = path
        self.activeBottomSheet = activeBottomSheet
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

    /// Alias para paridad nominal con Kotlin Compose `navigate.back()`.
    public func back() {
        pop()
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

    // MARK: - Soporte para BottomSheets

    /// Indica si hay un BottomSheet actualmente visible.
    public var isBottomSheetPresented: Bool {
        activeBottomSheet != nil
    }

    /// Presenta un BottomSheet global modal.
    public func presentBottomSheet(_ sheet: BottomSheetRoute) {
        activeBottomSheet = sheet
    }

    /// Cierra el BottomSheet activo actual.
    public func dismissBottomSheet() {
        activeBottomSheet = nil
    }
}
