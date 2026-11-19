//
//  NotifyPaymentBottomSheet.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// BottomSheet modal para notificar el pago de renta al titular adjuntando comprobante.
/// Equivalente en SwiftUI al composable `NotifyPaymentBottomSheet` de Jetpack Compose (`ui.components.botttom_sheets`).
public struct NotifyPaymentBottomSheet: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isPresented: Bool
    public var paymentConcept: String
    public var onDismiss: (() -> Void)?
    public var onNotify: (() -> Void)?

    private let isExternalBinding: Bool
    @State private var internalIsVisible: Bool = true

    public init(
        isPresented: Binding<Bool>,
        paymentConcept: String = "Renta julio",
        onDismiss: (() -> Void)? = nil,
        onNotify: (() -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.paymentConcept = paymentConcept
        self.onDismiss = onDismiss
        self.onNotify = onNotify
        self.isExternalBinding = true
    }

    public init(
        isVisible: Bool = true,
        paymentConcept: String = "Renta julio",
        onDismiss: (() -> Void)? = nil,
        onNotify: (() -> Void)? = nil
    ) {
        self._isPresented = .constant(isVisible)
        self.paymentConcept = paymentConcept
        self.onDismiss = onDismiss
        self.onNotify = onNotify
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
            NotifyPaymentBottomSheetContent(
                paymentConcept: paymentConcept,
                onClose: {
                    currentBinding.wrappedValue = false
                    onDismiss?()
                },
                onNotify: {
                    currentBinding.wrappedValue = false
                    onNotify?()
                }
            )
        }
    }
}

/// Contenido visual del BottomSheet para notificar el pago.
/// Equivalente en SwiftUI a `NotifyPaymentBottomSheetContent` de Jetpack Compose.
public struct NotifyPaymentBottomSheetContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var paymentConcept: String
    public var onClose: (() -> Void)?
    public var onNotify: (() -> Void)?

    public init(
        paymentConcept: String = "Renta julio",
        onClose: (() -> Void)? = nil,
        onNotify: (() -> Void)? = nil
    ) {
        self.paymentConcept = paymentConcept
        self.onClose = onClose
        self.onNotify = onNotify
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header con título e icono de cerrar
            HStack(alignment: .center) {
                Text("Notificar pago de \(paymentConcept)")
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

            // Tarjeta para adjuntar comprobante con borde discontinuo
            HStack(spacing: 12) {
                Image("clip_icon")
                    .renderingMode(.original)

                VStack(alignment: .leading, spacing: 0) {
                    Text("Adjuntar comprobante")
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink)

                    Text("Foto o captura del pago (opcional)")
                        .font(.dmSans(.regular, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.mute)
                }

                Spacer()
            }
            .padding(16)
            .background(Color.roomie.cardGlass)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .dashedBorder(color: Color.roomie.sand, cornerRadius: 16)

            // Botón de acción principal CTA
            GreenCTAButton(
                text: "Notificar al titular"
            ) {
                onNotify?()
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
            NotifyPaymentBottomSheetContent()
                .background(Color.roomie.card)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
    }
}
