//
//  UpdateRentBottomSheet.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// BottomSheet modal para notificar la actualización o incremento de la renta a los inquilinos.
/// Equivalente en SwiftUI al composable `UpdateRentBottomSheet` de Jetpack Compose (`ui.components.botttom_sheets`).
public struct UpdateRentBottomSheet: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isPresented: Bool
    public var onDismiss: (() -> Void)?
    public var onNotify: ((String, String) -> Void)?

    private let isExternalBinding: Bool
    @State private var internalIsVisible: Bool = true

    public init(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        onNotify: ((String, String) -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.onNotify = onNotify
        self.isExternalBinding = true
    }

    public init(
        isVisible: Bool = true,
        onDismiss: (() -> Void)? = nil,
        onNotify: ((String, String) -> Void)? = nil
    ) {
        self._isPresented = .constant(isVisible)
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
            UpdateRentBottomSheetContent(
                onClose: {
                    currentBinding.wrappedValue = false
                    onDismiss?()
                },
                onNotify: { newAmount, comment in
                    currentBinding.wrappedValue = false
                    onNotify?(newAmount, comment)
                }
            )
        }
    }
}

/// Contenido visual del BottomSheet para actualizar la renta.
/// Equivalente en SwiftUI a `UpdateRentBottomSheetContent` de Jetpack Compose.
public struct UpdateRentBottomSheetContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var amountText: String = "16500"
    @State private var commentText: String = ""

    public var onClose: (() -> Void)?
    public var onNotify: ((String, String) -> Void)?

    public init(
        initialAmount: String = "16500",
        initialComment: String = "",
        onClose: (() -> Void)? = nil,
        onNotify: ((String, String) -> Void)? = nil
    ) {
        self._amountText = State(initialValue: initialAmount)
        self._commentText = State(initialValue: initialComment)
        self.onClose = onClose
        self.onNotify = onNotify
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header con título e icono de cerrar
            HStack(alignment: .center) {
                Text("bottomsheet.update_rent.title")
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

            // Texto explicativo
            Text("bottomsheet.update_rent.desc")
                .font(.dmSans(.regular, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.mute)
                .fixedSize(horizontal: false, vertical: true)

            // Inputs con etiqueta
            InputWithLabel(
                label: "bottomsheet.update_rent.new_amount_label",
                text: $amountText
            )

            InputWithLabel(
                label: "bottomsheet.update_rent.comment_label",
                placeHolder: "bottomsheet.update_rent.comment_placeholder",
                text: $commentText
            )

            // Card para adjuntar evidencia
            HStack(spacing: 12) {
                Image("clip_icon")
                    .renderingMode(.original)

                VStack(alignment: .leading, spacing: 0) {
                    Text("bottomsheet.update_rent.attach_evidence")
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink)

                    Text("bottomsheet.update_rent.attach_hint")
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
                text: "bottomsheet.update_rent.submit"
            ) {
                onNotify?(amountText, commentText)
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
            UpdateRentBottomSheetContent()
                .background(Color.roomie.card)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
    }
}
