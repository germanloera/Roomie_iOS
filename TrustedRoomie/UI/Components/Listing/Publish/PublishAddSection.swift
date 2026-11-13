//
//  PublishAddSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección en tarjeta para agregar múltiples elementos de texto con botón "+ Agregar" en la cabecera.
/// Equivalente en SwiftUI al composable `PublishAddSection` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishAddSection: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var placeHolder: String
    public var onItemsChanged: (([String]) -> Void)?

    @Binding private var bindingItems: [String]
    @State private var internalItems: [String] = []
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        title: String = "",
        placeHolder: String = "",
        items: Binding<[String]>,
        onItemsChanged: (([String]) -> Void)? = nil
    ) {
        self.title = title
        self.placeHolder = placeHolder
        self._bindingItems = items
        self.isExternalBinding = true
        self.onItemsChanged = onItemsChanged
    }

    /// Inicializador con valor por defecto y callback opcional (equivalente directo a Compose).
    public init(
        title: String = "",
        placeHolder: String = "",
        initialItems: [String] = [],
        onItemsChanged: (([String]) -> Void)? = nil
    ) {
        self.title = title
        self.placeHolder = placeHolder
        self._bindingItems = .constant([])
        self.isExternalBinding = false
        self._internalItems = State(initialValue: initialItems)
        self.onItemsChanged = onItemsChanged
    }

    private var currentItems: [String] {
        isExternalBinding ? bindingItems : internalItems
    }

    private func addItem() {
        if isExternalBinding {
            bindingItems.append("")
            onItemsChanged?(bindingItems)
        } else {
            internalItems.append("")
            onItemsChanged?(internalItems)
        }
    }

    private func updateItem(at index: Int, with value: String) {
        if isExternalBinding {
            guard index < bindingItems.count else { return }
            bindingItems[index] = value
            onItemsChanged?(bindingItems)
        } else {
            guard index < internalItems.count else { return }
            internalItems[index] = value
            onItemsChanged?(internalItems)
        }
    }

    private func removeItem(at index: Int) {
        if isExternalBinding {
            guard index < bindingItems.count else { return }
            bindingItems.remove(at: index)
            onItemsChanged?(bindingItems)
        } else {
            guard index < internalItems.count else { return }
            internalItems.remove(at: index)
            onItemsChanged?(internalItems)
        }
    }

    public var body: some View {
        BaseListingCardSection(
            label: title,
            rightItem: {
                PublishAdd {
                    addItem()
                }
            }
        ) {
            if !currentItems.isEmpty {
                VStack(spacing: 8) {
                    ForEach(Array(currentItems.enumerated()), id: \.offset) { index, item in
                        PublishAddText(
                            text: item,
                            onTextChanged: { newText in
                                updateItem(at: index, with: newText)
                            },
                            onTap: {
                                removeItem(at: index)
                            }
                        )
                    }
                }
                .frame(maxWidth: .infinity)
            } else {
                Text(placeHolder)
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)
            }
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            PublishAddSection(
                title: "Reglas de la casa",
                placeHolder: "Agrega las reglas que consideres necesarias...",
                initialItems: ["No fumar", "Mascotas permitidas con depósito"]
            )

            PublishAddSection(
                title: "Servicios incluidos",
                placeHolder: "Ningún servicio agregado aún"
            )
        }
        .padding()
    }
}
