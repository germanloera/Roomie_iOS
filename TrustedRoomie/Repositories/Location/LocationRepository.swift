//
//  LocationRepository.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import Observation

/// Repositorio reactivo que expone la ubicación actual y geocodificación de direcciones.
@Observable
@MainActor
public final class LocationRepository: LocationRepositoryProtocol {
    public static let shared = LocationRepository()

    public private(set) var currentLocation: LocationModel?
    public private(set) var isLoading: Bool = false
    public private(set) var lastError: LocationError?

    private let locationService: LocationService

    public init(locationService: LocationService = .shared) {
        self.locationService = locationService
    }

    /// Fuerza la actualización de la coordenada actual con alta precisión.
    @discardableResult
    public func updateLocation() async throws -> LocationModel {
        isLoading = true
        lastError = nil

        do {
            let location = try await locationService.requestCurrentLocation()
            self.currentLocation = location
            self.isLoading = false
            return location
        } catch let locError as LocationError {
            self.lastError = locError
            self.isLoading = false
            throw locError
        } catch {
            let wrapped = LocationError.unableToFindLocation(error.localizedDescription)
            self.lastError = wrapped
            self.isLoading = false
            throw wrapped
        }
    }

    /// Obtiene las coordenadas geográficas de una dirección usando el geocodificador nativo de Apple.
    public func getCoordinates(from address: String) async throws -> LocationModel {
        isLoading = true
        lastError = nil

        do {
            let model = try await locationService.getCoordinates(from: address)
            self.isLoading = false
            return model
        } catch let locError as LocationError {
            self.lastError = locError
            self.isLoading = false
            throw locError
        } catch {
            let wrapped = LocationError.geocodingFailed(error.localizedDescription)
            self.lastError = wrapped
            self.isLoading = false
            throw wrapped
        }
    }

    /// Inicia la actualización automática al inicio tan pronto como el permiso esté disponible.
    public func startAutoTrackingIfAuthorized() async {
        guard PermissionManager.shared.locationStatus.isAuthorized else { return }
        do {
            _ = try await updateLocation()
        } catch {
            // Error capturado en `lastError` para ser inspeccionado por la UI sin romper el flujo
        }
    }
}
