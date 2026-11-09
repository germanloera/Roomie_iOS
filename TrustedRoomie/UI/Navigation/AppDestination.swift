import Foundation

/// Representa los destinos de navegación disponibles en la aplicación.
/// Agrega nuevos casos conforme crees nuevas pantallas en la app.
public enum AppDestination: Hashable, Identifiable {
    case emptyExample(title: String = "Pantalla de Ejemplo")
    
    
    /***********************/
   
    case Home(title: String = "")
    case ListingDetails(title: String = "")

    public var id: String {
        switch self {
        case .emptyExample(let title):
            return "emptyExample_\(title)"
        case .Home(title: let title):
            return "Home"
        case .ListingDetails(title: let title):
            return "ListingDetails"
        }
    }
}
