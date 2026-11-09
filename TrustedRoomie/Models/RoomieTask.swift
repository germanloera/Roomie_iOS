import Foundation

struct RoomieTask: Identifiable, Codable, Sendable {
    let id: Int
    var title: String
    var completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case completed
    }
}
