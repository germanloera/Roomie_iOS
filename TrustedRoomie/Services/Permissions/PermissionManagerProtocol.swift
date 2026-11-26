//
//  PermissionManagerProtocol.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation

/// Protocolo que abstrae el gestor centralizado de permisos de la aplicación.
@MainActor
public protocol PermissionManagerProtocol: AnyObject {
    var notificationsStatus: PermissionStatus { get }
    var locationStatus: PermissionStatus { get }
    var photoLibraryStatus: PermissionStatus { get }

    func status(for type: PermissionType) -> PermissionStatus
    func refreshStatuses() async
    func requestPermission(_ type: PermissionType) async -> PermissionStatus
    func requestStartupPermissions() async
    func openAppSettings()
}
