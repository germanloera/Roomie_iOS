//
//  PermissionExplanationDialog.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import SwiftUI

/// Bottom sheet explicativo que presenta al usuario el valor del permiso solicitado,
/// permitiendo solicitarlo directamente o redirigir a Ajustes si está denegado.
public struct PermissionExplanationDialog: View {
    @Binding public var isPresented: Bool
    public let permissionType: PermissionType
    public var onPermissionResolved: ((PermissionStatus) -> Void)?

    private let permissionManager = PermissionManager.shared

    public init(
        isPresented: Binding<Bool>,
        permissionType: PermissionType,
        onPermissionResolved: ((PermissionStatus) -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.permissionType = permissionType
        self.onPermissionResolved = onPermissionResolved
    }

    private var currentStatus: PermissionStatus {
        permissionManager.status(for: permissionType)
    }

    public var body: some View {
        BaseBottomSheet(isPresented: $isPresented) {
            VStack(alignment: .leading, spacing: 18) {
                // Icono e indicador de estado
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(Color.roomie.pineContainer)
                            .frame(width: 48, height: 48)

                        Image(systemName: permissionType.systemImage)
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(Color.roomie.pine)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(permissionType.title)
                            .font(.dmSans(.semiBold, size: 18))
                            .foregroundStyle(Color.roomie.ink)

                        Text("Estado actual: \(currentStatus.displayName)")
                            .font(.dmSans(.regular, size: 13))
                            .foregroundStyle(currentStatus.isAuthorized ? Color.roomie.pine : Color.roomie.mute)
                    }
                }

                // Razón contextual
                Text(permissionType.rationaleDescription)
                    .font(.dmSans(.regular, size: 14))
                    .foregroundStyle(Color.roomie.mute)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer().frame(height: 8)

                // Acciones
                VStack(spacing: 10) {
                    if currentStatus.requiresSettingsRedirect {
                        GreenCTAButton(text: "Abrir Ajustes de iOS", onTap: {
                            permissionManager.openAppSettings()
                            isPresented = false
                        })
                    } else {
                        GreenCTAButton(text: "Permitir acceso", onTap: {
                            Task {
                                let status = await permissionManager.requestPermission(permissionType)
                                onPermissionResolved?(status)
                                isPresented = false
                            }
                        })
                    }

                    BeigeButton(text: "Ahora no", onTap: {
                        isPresented = false
                    })
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 32)
        }
    }
}

public extension View {
    /// Presenta el diálogo explicativo de permisos como overlay modal reutilizable.
    func permissionExplanationDialog(
        isPresented: Binding<Bool>,
        permissionType: PermissionType,
        onPermissionResolved: ((PermissionStatus) -> Void)? = nil
    ) -> some View {
        self.overlay {
            PermissionExplanationDialog(
                isPresented: isPresented,
                permissionType: permissionType,
                onPermissionResolved: onPermissionResolved
            )
        }
    }
}
