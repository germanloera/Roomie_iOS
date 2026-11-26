//
//  LocationModel.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import CoreLocation

/// Representación agnóstica y reactiva de una posición geográfica.
public struct LocationModel: Identifiable, Codable, Equatable, Hashable, Sendable {
    public let id: UUID
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double
    public let accuracy: Double
    public let timestamp: Date

    public init(
        id: UUID = UUID(),
        latitude: Double,
        longitude: Double,
        altitude: Double = 0.0,
        accuracy: Double = 0.0,
        timestamp: Date = Date()
    ) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.accuracy = accuracy
        self.timestamp = timestamp
    }

    /// Inicializador de conveniencia a partir de un `CLLocation` del sistema.
    public init(from clLocation: CLLocation) {
        self.id = UUID()
        self.latitude = clLocation.coordinate.latitude
        self.longitude = clLocation.coordinate.longitude
        self.altitude = clLocation.altitude
        self.accuracy = clLocation.horizontalAccuracy
        self.timestamp = clLocation.timestamp
    }

    /// Coordenadas formateadas de forma legible (ej. "19.4326, -99.1332").
    public var formattedCoordinates: String {
        String(format: "%.4f, %.4f", latitude, longitude)
    }

    /// Retorna una instancia `CLLocationCoordinate2D` de CoreLocation.
    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    /// Calcula la distancia en metros hacia otra ubicación.
    public func distance(to other: LocationModel) -> Double {
        let from = CLLocation(latitude: latitude, longitude: longitude)
        let to = CLLocation(latitude: other.latitude, longitude: other.longitude)
        return from.distance(from: to)
    }
}
