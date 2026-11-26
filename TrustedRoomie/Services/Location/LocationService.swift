//
//  LocationService.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import CoreLocation

/// Servicio nativo de CoreLocation y Geocodificación sin dependencias externas.
@MainActor
public final class LocationService: NSObject {
    public static let shared = LocationService()

    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()

    private var singleLocationContinuation: CheckedContinuation<LocationModel, Error>?

    public override init() {
        super.init()
        setupLocationManager()
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10 // metros
    }

    // MARK: - Ubicación en Tiempo Real

    /// Solicita una actualización puntual de alta precisión utilizando Swift Concurrency.
    public func requestCurrentLocation() async throws -> LocationModel {
        guard CLLocationManager.locationServicesEnabled() else {
            throw LocationError.servicesDisabled
        }

        let status = locationManager.authorizationStatus
        guard status == .authorizedWhenInUse || status == .authorizedAlways else {
            throw LocationError.permissionDenied
        }

        // Cancelar petición anterior si existiera
        singleLocationContinuation?.resume(throwing: LocationError.timeout)
        singleLocationContinuation = nil

        return try await withCheckedThrowingContinuation { continuation in
            self.singleLocationContinuation = continuation
            self.locationManager.requestLocation()
        }
    }

    // MARK: - Geocodificación Nativa (Dirección ➡️ Coordenadas)

    /// Convierte una dirección de texto a coordenadas geográficas usando `CLGeocoder`.
    /// 100% nativo y gratuito sin necesidad de APIs externas.
    public func getCoordinates(from address: String) async throws -> LocationModel {
        let trimmed = address.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            throw LocationError.emptyAddress
        }

        do {
            let placemarks = try await geocoder.geocodeAddressString(trimmed)
            guard let firstPlacemark = placemarks.first,
                  let location = firstPlacemark.location else {
                throw LocationError.geocodingFailed("No se encontraron coordenadas válidas para la dirección.")
            }

            return LocationModel(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude,
                altitude: location.altitude,
                accuracy: location.horizontalAccuracy,
                timestamp: location.timestamp
            )
        } catch let locError as LocationError {
            throw locError
        } catch {
            throw LocationError.geocodingFailed(error.localizedDescription)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {
    public nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.last else { return }
        Task { @MainActor in
            let model = LocationModel(from: latest)
            if let continuation = self.singleLocationContinuation {
                self.singleLocationContinuation = nil
                continuation.resume(returning: model)
            }
        }
    }

    public nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Task { @MainActor in
            if let clErr = error as? CLError, clErr.code == .denied {
                self.singleLocationContinuation?.resume(throwing: LocationError.permissionDenied)
            } else {
                self.singleLocationContinuation?.resume(throwing: LocationError.unableToFindLocation(error.localizedDescription))
            }
            self.singleLocationContinuation = nil
        }
    }
}
