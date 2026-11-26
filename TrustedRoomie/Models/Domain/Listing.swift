//
//  Listing.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Entidad de publicación correspondiente a la tabla `listings` en Supabase.
nonisolated public struct Listing: Codable, Identifiable, Hashable, Sendable {
    public var id: String
    public var propertyId: String
    public var titularUserId: String
    public var title: String
    public var price: Double
    public var currency: String
    public var sizeDescription: String
    public var roomsCount: Int
    public var status: ListingStatus
    public var mapX: Int?
    public var mapY: Int?
    public var hue: Int?
    public var coverPhotoUrl: String?
    public var createdAt: String
    public var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case propertyId = "property_id"
        case titularUserId = "titular_user_id"
        case title
        case price
        case currency
        case sizeDescription = "size_description"
        case roomsCount = "rooms_count"
        case status
        case mapX = "map_x"
        case mapY = "map_y"
        case hue
        case coverPhotoUrl = "cover_photo_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    public init(
        id: String,
        propertyId: String,
        titularUserId: String,
        title: String,
        price: Double,
        currency: String = "MXN",
        sizeDescription: String,
        roomsCount: Int = 3,
        status: ListingStatus = .disponible,
        mapX: Int? = nil,
        mapY: Int? = nil,
        hue: Int? = 150,
        coverPhotoUrl: String? = nil,
        createdAt: String = "",
        updatedAt: String = ""
    ) {
        self.id = id
        self.propertyId = propertyId
        self.titularUserId = titularUserId
        self.title = title
        self.price = price
        self.currency = currency
        self.sizeDescription = sizeDescription
        self.roomsCount = roomsCount
        self.status = status
        self.mapX = mapX
        self.mapY = mapY
        self.hue = hue
        self.coverPhotoUrl = coverPhotoUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
