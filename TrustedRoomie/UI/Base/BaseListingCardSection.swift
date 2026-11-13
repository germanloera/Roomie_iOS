//
//  BaseListingCardSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Sección base para tarjetas de listing con etiqueta de encabezado en mayúsculas, elemento derecho opcional y contenedor BaseCard.
/// Equivalente en SwiftUI al composable `BaseListingCardSection` de Jetpack Compose (`ui.base`).
public struct BaseListingCardSection<Content: View>: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var label: String
    public var rightItem: AnyView?
    public var content: Content?

    public init<R: View>(
        label: String = "",
        @ViewBuilder rightItem: () -> R,
        @ViewBuilder content: () -> Content
    ) {
        self.label = label
        self.rightItem = AnyView(rightItem())
        self.content = content()
    }

    public init(
        label: String = "",
        @ViewBuilder content: () -> Content
    ) {
        self.label = label
        self.rightItem = nil
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if !label.isEmpty {
                    Text(label.uppercased())
                        .font(.dmSans(.extraBold, size: 13))
                        .lineSpacing(19.5 - 13)
                        .kerning(0.65)
                        .foregroundStyle(Color.roomie.mute)
                }

                Spacer()

                if let rightItem {
                    rightItem
                }
            }

            BaseCard {
                if let content {
                    content
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

public extension BaseListingCardSection where Content == EmptyView {
    init(label: String = "") {
        self.label = label
        self.rightItem = nil
        self.content = nil
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            BaseListingCardSection(label: "Información") {
                Text("Contenido de prueba de la sección dentro de la tarjeta.")
                    .font(.dmSans(.regular, size: 14))
                    .foregroundStyle(Color.roomie.ink)
            }

            BaseListingCardSection(
                label: "Reglas",
                rightItem: {
                    Text("Editar")
                        .font(.dmSans(.semiBold, size: 12))
                        .foregroundStyle(Color.roomie.pine)
                }
            ) {
                Text("No fumar en áreas comunes.")
                    .font(.dmSans(.regular, size: 14))
                    .foregroundStyle(Color.roomie.ink)
            }
        }
        .padding()
    }
}
