//
//  AppRemoteConfigConstants.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation

/// Contenedor de variables accesibles para la inicialización de Flagsmith y servicios remotos.
/// Estas variables se dejan vacías para ser integradas posteriormente.
public struct AppRemoteConfigConstants: Sendable {
    /// Llave de entorno de Flagsmith (Environment Key)
    public static var flagsmithEnvironmentKey: String = "jQ5TSCSfsGymRE7qMsMrxu"

    /// URL base de la instancia de Flagsmith
    public static var flagsmithBaseURL: String = "http://192.168.86.30:8002/api/v1/"
}
