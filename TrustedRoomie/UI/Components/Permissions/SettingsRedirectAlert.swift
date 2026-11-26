//
//  SettingsRedirectAlert.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import SwiftUI

/// Modificador reutilizable que muestra una alerta nativa cuando un permiso ha sido denegado
/// permanentemente, ofreciendo un botón directo para abrir los Ajustes de iOS.
public struct SettingsRedirectAlert: ViewModifier {
    @Binding public var isPresented: Bool
    public let permissionType: PermissionType
    public let customMessage: String?
    public let onDismiss: (() -> Void)?

    public init(
        isPresented: Binding<Bool>,
        permissionType: PermissionType,
        customMessage: String? = nil,
        onDismiss: (() -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.permissionType = permissionType
        self.customMessage = customMessage
        self.onDismiss = onDismiss
    }

    public func body(content: Content) -> some View {
        content
            .alert(
                "Permiso de \(permissionType.title) requerido",
                isPresented: $isPresented
            ) {
                Button("Abrir Ajustes") {
                    PermissionManager.shared.openAppSettings()
                    onDismiss?()
                }
                Button("Cancelar", role: .cancel) {
                    onDismiss?()
                }
            } message: {
                Text(customMessage ?? permissionType.rationaleDescription)
            }
    }
}

public extension View {
    /// Presenta una alerta informativa con redirección a Ajustes si el permiso fue denegado.
    func permissionSettingsAlert(
        isPresented: Binding<Bool>,
        permissionType: PermissionType,
        customMessage: String? = nil,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        self.modifier(
            SettingsRedirectAlert(
                isPresented: isPresented,
                permissionType: permissionType,
                customMessage: customMessage,
                onDismiss: onDismiss
            )
        )
    }
}
