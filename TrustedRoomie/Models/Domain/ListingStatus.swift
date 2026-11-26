//
//  ListingStatus.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

nonisolated public enum ListingStatus: String, Codable, Sendable {
    case disponible = "disponible"
    case pendiente = "pendiente"
    case oculto = "oculto"
}
