//
//  DeleteListingBottomSheet.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// BottomSheet modal para confirmar la eliminación definitiva de un anuncio/listing.
/// Equivalente en SwiftUI al composable `DeleteListingBottomSheet` de Jetpack Compose (`ui.components.botttom_sheets`).
public struct DeleteListingBottomSheet: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isPresented: Bool
    public var listingTitle: String
    public var onDismiss: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onDelete: (() -> Void)?

    private let isExternalBinding: Bool
    @State private var internalIsVisible: Bool = false

    /// Inicializador estándar de SwiftUI con Binding.
    public init(
        isPresented: Binding<Bool>,
        listingTitle: String = "Cuarto luminoso en la Roma Norte",
        onDismiss: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.listingTitle = listingTitle
        self.onDismiss = onDismiss
        self.onCancel = onCancel
        self.onDelete = onDelete
        self.isExternalBinding = true
    }

    /// Inicializador de conveniencia con visibilidad estática (paridad con Compose).
    public init(
        isVisible: BooleanLiteralType = false,
        listingTitle: String = "Cuarto luminoso en la Roma Norte",
        onDismiss: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self._isPresented = .constant(isVisible)
        self.listingTitle = listingTitle
        self.onDismiss = onDismiss
        self.onCancel = onCancel
        self.onDelete = onDelete
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
            DeleteListingBottomSheetContent(
                listingTitle: listingTitle,
                onClose: {
                    currentBinding.wrappedValue = false
                    onDismiss?()
                },
                onCancel: {
                    currentBinding.wrappedValue = false
                    onCancel?() ?? onDismiss?()
                },
                onDelete: {
                    currentBinding.wrappedValue = false
                    onDelete?()
                }
            )
        }
    }
}

/// Contenido visual del BottomSheet para eliminar un anuncio.
/// Equivalente en SwiftUI a `DeleteListingBottomSheetContent` de Jetpack Compose.
public struct DeleteListingBottomSheetContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var listingTitle: String
    public var onClose: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onDelete: (() -> Void)?

    public init(
        listingTitle: String = "Cuarto luminoso en la Roma Norte",
        onClose: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.listingTitle = listingTitle
        self.onClose = onClose
        self.onCancel = onCancel
        self.onDelete = onDelete
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header con título e icono de cerrar
            HStack(alignment: .center) {
                Text("Eliminar anuncio")
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

            // Texto descriptivo con resaltado
            (
                Text("Eliminarás ")
                + Text(listingTitle).fontWeight(.semibold)
                + Text(" de forma definitiva. Esta acción no se puede deshacer.")
            )
            .font(.dmSans(.regular, size: 14))
            .lineSpacing(20 - 14)
            .foregroundStyle(Color.roomie.ink)
            .fixedSize(horizontal: false, vertical: true)

            // Botones de acción
            HStack(spacing: 12) {
                BaseSimpleButton(
                    text: "Cancelar",
                    onTap: onCancel
                )
                .frame(maxWidth: .infinity)

                BaseSimpleButton(
                    text: "Eliminar anuncio",
                    textColor: Color.roomie.destructive,
                    borderColor: Color.roomie.destructive,
                    background: Color.roomie.destructiveContainer,
                    onTap: onDelete
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
            DeleteListingBottomSheetContent()
                .background(Color.roomie.card)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
    }
}
