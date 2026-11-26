//
//  PermissionManager.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import SwiftUI
import Observation
import UserNotifications
import CoreLocation
import Photos
import UIKit

/// Gestor centralizado y reactivo de permisos para TrustedRoomie.
/// Supervisa Notificaciones, Ubicación (WhenInUse) y Fototeca en tiempo real.
@Observable
@MainActor
public final class PermissionManager: NSObject, PermissionManagerProtocol {
    public static let shared = PermissionManager()

    // MARK: - Estados Reactivos
    public private(set) var notificationsStatus: PermissionStatus = .notDetermined
    public private(set) var locationStatus: PermissionStatus = .notDetermined
    public private(set) var photoLibraryStatus: PermissionStatus = .notDetermined
    public private(set) var isRefreshing: Bool = false

    // MARK: - Dependencias Nativas
    private let locationManager = CLLocationManager()
    private var locationContinuation: CheckedContinuation<PermissionStatus, Never>?
    nonisolated(unsafe) private var appActiveObserver: Task<Void, Never>?

    public override init() {
        super.init()
        setupLocationDelegate()
        setupLifecycleObserver()
        Task { [weak self] in
            await self?.refreshStatuses()
        }
    }

    deinit {
        appActiveObserver?.cancel()
    }

    // MARK: - Configuración de Ciclo de Vida y Delegados

    private func setupLocationDelegate() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationStatus = currentCLLocationStatus(locationManager.authorizationStatus)
    }

    private func setupLifecycleObserver() {
        appActiveObserver = Task { [weak self] in
            for await _ in NotificationCenter.default.notifications(named: UIApplication.didBecomeActiveNotification) {
                guard let self else { return }
                await self.refreshStatuses()
            }
        }
    }

    // MARK: - Consulta de Estado

    public func status(for type: PermissionType) -> PermissionStatus {
        switch type {
        case .notifications:
            return notificationsStatus
        case .locationWhenInUse:
            return locationStatus
        case .photoLibrary:
            return photoLibraryStatus
        }
    }

    // MARK: - Refresco en Tiempo Real

    public func refreshStatuses() async {
        isRefreshing = true
        async let notif = checkNotificationsStatus()
        async let loc = checkLocationStatus()
        async let photos = checkPhotoLibraryStatus()

        let (newNotif, newLoc, newPhotos) = await (notif, loc, photos)

        self.notificationsStatus = newNotif
        self.locationStatus = newLoc
        self.photoLibraryStatus = newPhotos
        self.isRefreshing = false
    }

    // MARK: - Solicitud de Permisos Individuales

    @discardableResult
    public func requestPermission(_ type: PermissionType) async -> PermissionStatus {
        switch type {
        case .notifications:
            return await requestNotificationsPermission()
        case .locationWhenInUse:
            return await requestLocationPermission()
        case .photoLibrary:
            return await requestPhotoLibraryPermission()
        }
    }

    // MARK: - Solicitud al Inicio (No Bloqueante)

    /// Verifica al inicio de la aplicación los permisos pendientes y los solicita
    /// sin bloquear la navegación ni la experiencia de usuario.
    public func requestStartupPermissions() async {
        await refreshStatuses()

        // 1. Notificaciones: si está no determinado, solicitar de forma asíncrona
        if notificationsStatus.canRequestDirectly {
            _ = await requestNotificationsPermission()
        }

        // 2. Ubicación: si está pendiente, solicitar autorización de uso en app
        if locationStatus.canRequestDirectly {
            _ = await requestLocationPermission()
        }

        // 3. Fotos: si está pendiente, solicitar acceso
        if photoLibraryStatus.canRequestDirectly {
            _ = await requestPhotoLibraryPermission()
        }

        await refreshStatuses()
    }

    // MARK: - Redirección a Ajustes de iOS

    /// Redirige al usuario a la página de Ajustes de la aplicación cuando un permiso
    /// fue permanentemente denegado o restringido.
    public func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    // MARK: - Verificaciones y Peticiones Internas

    private func checkNotificationsStatus() async -> PermissionStatus {
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        switch settings.authorizationStatus {
        case .authorized, .provisional, .ephemeral:
            return .authorized
        case .denied:
            return .denied
        case .notDetermined:
            return .notDetermined
        @unknown default:
            return .notDetermined
        }
    }

    private func requestNotificationsPermission() async -> PermissionStatus {
        do {
            let granted = try await UNUserNotificationCenter.current().requestAuthorization(
                options: [.alert, .badge, .sound]
            )
            let newStatus: PermissionStatus = granted ? .authorized : .denied
            self.notificationsStatus = newStatus
            return newStatus
        } catch {
            let fallback = await checkNotificationsStatus()
            self.notificationsStatus = fallback
            return fallback
        }
    }

    private func checkLocationStatus() -> PermissionStatus {
        guard CLLocationManager.locationServicesEnabled() else {
            return .denied
        }
        return currentCLLocationStatus(locationManager.authorizationStatus)
    }

    private func requestLocationPermission() async -> PermissionStatus {
        guard CLLocationManager.locationServicesEnabled() else {
            self.locationStatus = .denied
            return .denied
        }

        let current = locationManager.authorizationStatus
        if current != .notDetermined {
            let status = currentCLLocationStatus(current)
            self.locationStatus = status
            return status
        }

        return await withCheckedContinuation { continuation in
            self.locationContinuation = continuation
            self.locationManager.requestWhenInUseAuthorization()
        }
    }

    private func checkPhotoLibraryStatus() -> PermissionStatus {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        return currentPHStatus(status)
    }

    private func requestPhotoLibraryPermission() async -> PermissionStatus {
        let status = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        let mapped = currentPHStatus(status)
        self.photoLibraryStatus = mapped
        return mapped
    }

    // MARK: - Mapeadores de Estados Nativos

    private func currentCLLocationStatus(_ status: CLAuthorizationStatus) -> PermissionStatus {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            return .authorized
        case .denied:
            return .denied
        case .restricted:
            return .restricted
        case .notDetermined:
            return .notDetermined
        @unknown default:
            return .notDetermined
        }
    }

    private func currentPHStatus(_ status: PHAuthorizationStatus) -> PermissionStatus {
        switch status {
        case .authorized:
            return .authorized
        case .limited:
            return .limited
        case .denied:
            return .denied
        case .restricted:
            return .restricted
        case .notDetermined:
            return .notDetermined
        @unknown default:
            return .notDetermined
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension PermissionManager: CLLocationManagerDelegate {
    public nonisolated func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        Task { @MainActor in
            let mapped = self.currentCLLocationStatus(manager.authorizationStatus)
            self.locationStatus = mapped
            if let continuation = self.locationContinuation {
                self.locationContinuation = nil
                continuation.resume(returning: mapped)
            }
        }
    }
}
