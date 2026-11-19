//
//  SharedPaymentBottomSheet.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// BottomSheet modal para registrar un nuevo gasto compartido entre inquilinos.
/// Equivalente en SwiftUI al composable `SharedPaymentBottomSheet` de Jetpack Compose (`ui.components.botttom_sheets`).
public struct SharedPaymentBottomSheet: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isPresented: Bool
    public var onDismiss: (() -> Void)?
    public var onAddAndNotify: ((String, String, String) -> Void)?

    private let isExternalBinding: Bool
    @State private var internalIsVisible: Bool = true

    public init(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        onAddAndNotify: ((String, String, String) -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.onAddAndNotify = onAddAndNotify
        self.isExternalBinding = true
    }

    public init(
        isVisible: Bool = true,
        onDismiss: (() -> Void)? = nil,
        onAddAndNotify: ((String, String, String) -> Void)? = nil
    ) {
        self._isPresented = .constant(isVisible)
        self.onDismiss = onDismiss
        self.onAddAndNotify = onAddAndNotify
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
            SharedPaymentBottomSheetContent(
                onClose: {
                    currentBinding.wrappedValue = false
                    onDismiss?()
                },
                onAddAndNotify: { service, amount, dueDate in
                    currentBinding.wrappedValue = false
                    onAddAndNotify?(service, amount, dueDate)
                }
            )
        }
    }
}

/// Contenido visual del BottomSheet para nuevo gasto compartido.
/// Equivalente en SwiftUI a `SharedPaymentBottomSheetContent` de Jetpack Compose.
public struct SharedPaymentBottomSheetContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var serviceName: String = ""
    @State private var monthlyAmount: String = ""
    @State private var paymentDueDate: String = ""

    public var onClose: (() -> Void)?
    public var onAddAndNotify: ((String, String, String) -> Void)?

    public init(
        initialService: String = "",
        initialAmount: String = "",
        initialDueDate: String = "",
        onClose: (() -> Void)? = nil,
        onAddAndNotify: ((String, String, String) -> Void)? = nil
    ) {
        self._serviceName = State(initialValue: initialService)
        self._monthlyAmount = State(initialValue: initialAmount)
        self._paymentDueDate = State(initialValue: initialDueDate)
        self.onClose = onClose
        self.onAddAndNotify = onAddAndNotify
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header con título e icono de cerrar
            HStack(alignment: .center) {
                Text("Nuevo gasto compartido")
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

            // Campos del formulario con InputWithLabel
            InputWithLabel(
                label: "Servicio ",
                placeHolder: "Gas, agua, limpieza…",
                text: $serviceName
            )

            InputWithLabel(
                label: "Monto total mensual ",
                placeHolder: "1200",
                text: $monthlyAmount
            )

            InputWithLabel(
                label: "Fecha límite de pago ",
                placeHolder: "20 jul",
                text: $paymentDueDate
            )

            // Leyenda de división
            Text("Se divide en partes iguales entre 3 inquilinos: — c/u.")
                .font(.dmSans(.regular, size: 12))
                .lineSpacing(16 - 12)
                .foregroundStyle(Color.roomie.mute)

            // Botón CTA
            GreenCTAButton(
                text: "Agregar y notificar"
            ) {
                onAddAndNotify?(serviceName, monthlyAmount, paymentDueDate)
                // router?.navigate(to: AppDestination.passwordRecoveryConfirmation)
            }
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
            SharedPaymentBottomSheetContent()
                .background(Color.roomie.card)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
    }
}
