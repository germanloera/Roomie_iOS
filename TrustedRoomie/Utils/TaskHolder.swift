//
//  TaskHolder.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/27/26.
//

nonisolated final class TaskHolder: @unchecked Sendable {
    var task: Task<Void, Never>?

    nonisolated init() {}

    nonisolated func cancel() {
        task?.cancel()
        task = nil
    }
}
