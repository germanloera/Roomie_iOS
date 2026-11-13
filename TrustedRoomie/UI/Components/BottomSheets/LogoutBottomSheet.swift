//
//  LogoutBottomSheet.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// BottomSheet modal de confirmación para cerrar sesión en la cuenta.
/// Equivalente en SwiftUI al composable `LogoutBottomSheet` de Jetpack Compose (`ui.components.botttom_sheets`).
public struct LogoutBottomSheet: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isPresented: Bool
    public var userEmail: String
    public var onDismiss: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onLogout: (() -> Void)?

    private let isExternalBinding: Bool
    @State private var internalIsVisible: Bool = false

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        isPresented: Binding<Bool>,
        userEmail: String = "diego@correo.com",
        onDismiss: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onLogout: (() -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.userEmail = userEmail
        self.onDismiss = onDismiss
        self.onCancel = onCancel
        self.onLogout = onLogout
        self.isExternalBinding = true
    }

    /// Inicializador con valor estático por conveniencia (equivalente directo a Compose).
    public init(
        isVisible: Bool = false,
        userEmail: String = "diego@correo.com",
        onDismiss: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onLogout: (() -> Void)? = nil
    ) {
        self._isPresented = .constant(isVisible)
        self.userEmail = userEmail
        self.onDismiss = onDismiss
        self.onCancel = onCancel
        self.onLogout = onLogout
        self.isExternalBinding = false
        self._internalIsVisible = State(initialValue: isVisible)
    }

    private var currentBinding: Binding<Bool> {
        if isExternalBinding {
            return $isPresented
        } else {
            return $internalIsVisible
        }
    }

    public var body: some View {
        BaseBottomSheet(
            isPresented: currentBinding,
            showDragHandle: false,
            onDismissRequest: {
                onDismiss?()
            }
        ) {
            LogoutBottomSheetContent(
                userEmail: userEmail,
                onClose: {
                    currentBinding.wrappedValue = false
                    onDismiss?()
                },
                onCancel: {
                    currentBinding.wrappedValue = false
                    onCancel?() ?? onDismiss?()
                },
                onLogout: {
                    currentBinding.wrappedValue = false
                    onLogout?()
                }
            )
        }
    }
}

/// Contenido visual del BottomSheet de cierre de sesión con título, descripción y botones de acción.
/// Equivalente en SwiftUI a `LogoutBottomSheetContent` de Jetpack Compose.
public struct LogoutBottomSheetContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var userEmail: String
    public var message: String?
    public var onClose: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onLogout: (() -> Void)?

    public init(
        title: String = "¿Cerrar sesión?",
        userEmail: String = "diego@correo.com",
        message: String? = nil,
        onClose: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onLogout: (() -> Void)? = nil
    ) {
        self.title = title
        self.userEmail = userEmail
        self.message = message
        self.onClose = onClose
        self.onCancel = onCancel
        self.onLogout = onLogout
    }

    private var descriptionText: String {
        if let message {
            return message
        }
        return "Cerrarás la sesión de \(userEmail) en este dispositivo. Podrás volver a iniciar sesión cuando quieras."
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header con título e icono de cerrar
            HStack(alignment: .center) {
                Text(title)
                    .font(.fraunces(.semiBold, size: 20))
                    .lineSpacing(28 - 20)
                    .foregroundStyle(Color.roomie.ink)

                Spacer()

                Button {
                    onClose?()
                } label: {
                    Image("close_icon")
                        .renderingMode(.template)
                        .foregroundStyle(Color.roomie.ink)
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity)

            // Mensaje informativo
            Text(descriptionText)
                .font(.dmSans(.regular, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.ink)
                .fixedSize(horizontal: false, vertical: true)

            // Botones de acción (Cancelar y Cerrar sesión)
            HStack(spacing: 12) {
                BaseSimpleButton(
                    text: "Cancelar",
                    onTap: onCancel
                )
                .frame(maxWidth: .infinity)

                BaseSimpleButton(
                    text: "Cerrar sesión",
                    textColor: Color.roomie.destructive,
                    borderColor: Color.roomie.destructive,
                    background: Color.roomie.destructiveContainer,
                    onTap: onLogout
                )
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            Spacer()
            LogoutBottomSheetContent()
                .background(Color.roomie.card)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
    }
}
