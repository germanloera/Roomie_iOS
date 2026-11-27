//
//  NotifyLeaveBottomSheet.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// BottomSheet modal para confirmar el envío de una solicitud de salida del cuarto/departamento.
/// Equivalente en SwiftUI al composable `NotifyLeaveBottomSheet` de Jetpack Compose (`ui.components.botttom_sheets`).
public struct NotifyLeaveBottomSheet: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isPresented: Bool
    public var reason: String
    public var onDismiss: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onConfirm: (() -> Void)?

    private let isExternalBinding: Bool
    @State private var internalIsVisible: Bool = true

    public init(
        isPresented: Binding<Bool>,
        reason: String = "Cambio de ciudad",
        onDismiss: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onConfirm: (() -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.reason = reason
        self.onDismiss = onDismiss
        self.onCancel = onCancel
        self.onConfirm = onConfirm
        self.isExternalBinding = true
    }

    public init(
        isVisible: Bool = true,
        reason: String = "Cambio de ciudad",
        onDismiss: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onConfirm: (() -> Void)? = nil
    ) {
        self._isPresented = .constant(isVisible)
        self.reason = reason
        self.onDismiss = onDismiss
        self.onCancel = onCancel
        self.onConfirm = onConfirm
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
            NotifyLeaveBottomSheetContent(
                reason: reason,
                onClose: {
                    currentBinding.wrappedValue = false
                    onDismiss?()
                },
                onCancel: {
                    currentBinding.wrappedValue = false
                    onCancel?() ?? onDismiss?()
                },
                onConfirm: {
                    currentBinding.wrappedValue = false
                    onConfirm?()
                }
            )
        }
    }
}

/// Contenido visual del BottomSheet para enviar la solicitud de salida.
/// Equivalente en SwiftUI a `NotifyLeaveBottomSheetContent` de Jetpack Compose.
public struct NotifyLeaveBottomSheetContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var reason: String
    public var onClose: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onConfirm: (() -> Void)?

    public init(
        reason: String = "Cambio de ciudad",
        onClose: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onConfirm: (() -> Void)? = nil
    ) {
        self.reason = reason
        self.onClose = onClose
        self.onCancel = onCancel
        self.onConfirm = onConfirm
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header con título e icono de cerrar
            HStack(alignment: .center) {
                Text("bottomsheet.notify_leave.title")
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

            // Banner de advertencia con contenedor de emergencia y borde destructivo
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 8) {
                    Image("exit_icon")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17, height: 17)
                        .padding(1)
                        .foregroundStyle(Color.roomie.destructive)

                    Text("bottomsheet.notify_leave.desc_1")
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.destructive)
                }

                Text("bottomsheet.notify_leave.desc_2")
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(19.5 - 12)
                    .foregroundStyle(Color.roomie.emergencyText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(Color.roomie.emergencyContainer)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color.roomie.destructiveContainer, lineWidth: 1)
            )

            // Motivo especificado
            Text("bottomsheet.notify_leave.reason \(reason)")
                .font(.dmSans(.regular, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.mute)

            // Botones de acción (Cancelar y Enviar solicitud)
            HStack(spacing: 12) {
                BaseSimpleButton(
                    text: "common.cancel",
                    onTap: onCancel
                )
                .frame(maxWidth: .infinity)

                BaseSimpleButton(
                    text: "bottomsheet.notify_leave.confirm",
                    textColor: Color.roomie.destructive,
                    borderColor: Color.roomie.destructive,
                    background: Color.roomie.destructiveContainer,
                    onTap: onConfirm
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
            NotifyLeaveBottomSheetContent()
                .background(Color.roomie.card)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
    }
}
