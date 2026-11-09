import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "La URL proporcionada no es válida."
        case .invalidResponse:
            return "Respuesta inválida del servidor."
        case .httpError(let statusCode):
            return "Error HTTP con código: \(statusCode)."
        case .decodingError(let error):
            return "Error al decodificar datos: \(error.localizedDescription)"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
