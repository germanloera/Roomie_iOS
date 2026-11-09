import Foundation

/// Representa los destinos de navegación disponibles en la aplicación.
/// Agrega nuevos casos conforme crees nuevas pantallas en la app.
public enum AppDestination: Hashable, Identifiable {
    case emptyExample(title: String = "Pantalla de Ejemplo")

    public var id: String {
        switch self {
        case .emptyExample(let title):
            return "emptyExample_\(title)"
        }
    }
}
