//
//  PublishPhotoItems.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Tarjeta para previsualizar y agregar fotos del departamento durante el flujo de publicación.
/// Equivalente en SwiftUI al composable `PublishPhotoItems` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishPhotoItems: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var photos: [String]
    public var onAddPhotosTap: (() -> Void)?

    public init(
        photos: [String] = [],
        onAddPhotosTap: (() -> Void)? = nil
    ) {
        self.photos = photos
        self.onAddPhotosTap = onAddPhotosTap
    }

    public var body: some View {
        BaseCard {
            VStack(alignment: .leading, spacing: 15) {
                // Fila de encabezado con miniatura y textos explicativos
                HStack(alignment: .top, spacing: 12) {
                    Image("listing_placeholder_small_blue")
                        .resizable()
                        .aspectRatio(1.5, contentMode: .fill)
                        .frame(width: 48, height: 36)
                        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Fotos del departamento")
                            .font(.dmSans(.semiBold, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.ink)

                        Text("La primera foto será la portada en el mapa y el listado.")
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }
                }

                // Fila de 4 miniaturas de fotos
                HStack(spacing: 12) {
                    ForEach(0..<4, id: \.self) { _ in
                        Image("listing_placeholder_small_blue")
                            .resizable()
                            .aspectRatio(1.5, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                    }
                }
                .frame(maxWidth: .infinity)

                // Botón para agregar fotos
                BaseSimpleButton(text: "Agregar fotos") {
                    onAddPhotosTap?()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            PublishPhotoItems {
                print("Agregar fotos presionado")
            }
        }
        .padding()
    }
}
