import SwiftUI

/// Modificador de vista que conecta `AppDestination` con su respectiva vista destino.
public struct AppNavigationDestinationModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .navigationDestination(for: AppDestination.self) { destination in
                switch destination {
                case .emptyExample(let title):
                    EmptyExampleView(title: title)
                }
            }
    }
}

public extension View {
    /// Agrega el manejador de destinos de navegación a la jerarquía de vistas.
    func withAppNavigation() -> some View {
        modifier(AppNavigationDestinationModifier())
    }
}
