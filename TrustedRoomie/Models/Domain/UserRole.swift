//
//  UserRole.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

nonisolated public enum UserRole: String, Codable, Sendable {
    case new = "NEW"
    case registered = "REGISTERED"
    case tenant = "TENANT"
    case leaseholder = "LEASEHOLDER"
}
