import Foundation

protocol NetworkServiceProtocol: Sendable {
    func fetchTasks() async throws -> [RoomieTask]
}

final class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let baseURL: String
    
    init(session: URLSession = .shared, baseURL: String = "https://jsonplaceholder.typicode.com") {
        self.session = session
        self.baseURL = baseURL
    }
    
    func fetchTasks() async throws -> [RoomieTask] {
        guard let url = URL(string: "\(baseURL)/todos?_limit=6") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(from: url)
        } catch {
            throw NetworkError.unknown(error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([RoomieTask].self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
