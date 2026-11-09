import Foundation
import SwiftUI
import Observation

@Observable
@MainActor
final class ContentViewModel {
    var greeting: String = "TrustedRoomie"
    var tasks: [RoomieTask] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol? = nil) {
        self.networkService = networkService ?? NetworkService()
    }
    
    func loadTasks() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            tasks = try await networkService.fetchTasks()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        let nextId = (tasks.map(\.id).max() ?? 0) + 1
        let newTask = RoomieTask(id: nextId, title: trimmed, completed: false)
        tasks.append(newTask)
    }
    
    func toggleTaskCompletion(for task: RoomieTask) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].completed.toggle()
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
