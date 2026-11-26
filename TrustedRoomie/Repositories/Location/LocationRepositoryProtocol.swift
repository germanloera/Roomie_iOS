//
//  LocationRepositoryProtocol.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation

/// Protocolo de abstracción para el repositorio de ubicación y geocodificación.
@MainActor
public protocol LocationRepositoryProtocol: AnyObject {
    var currentLocation: LocationModel? { get }
    var isLoading: Bool { get }
    var lastError: LocationError? { get }

    func updateLocation() async throws -> LocationModel
    func getCoordinates(from address: String) async throws -> LocationModel
    func startAutoTrackingIfAuthorized() async
}
