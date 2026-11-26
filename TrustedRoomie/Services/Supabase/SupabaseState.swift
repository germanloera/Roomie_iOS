//
//  SupabaseState.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Estado del ciclo de vida de SupabaseProvider.
public enum SupabaseState: Sendable {
    case initializing
    case ready
    case error(any Error)
}

extension SupabaseState: CustomStringConvertible {
    public var description: String {
        switch self {
        case .initializing:
            return "Initializing"
        case .ready:
            return "Ready"
        case .error(let error):
            return "Error(\(error.localizedDescription))"
        }
    }
}
