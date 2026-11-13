//
//  PublishAdd.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Botón pequeño para agregar elementos en el flujo de publicación ("+ Agregar").
/// Equivalente en SwiftUI al composable `PublishAdd` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishAdd: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var onTap: (() -> Void)?

    public init(
        text: String = "Agregar",
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 4) {
                Image(systemName: "plus")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color.roomie.pine)

                Text(text)
                    .font(.dmSans(.semiBold, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.pine)
                    .multilineTextAlignment(.center)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        HStack(spacing: 24) {
            PublishAdd {
                print("Agregar presionado")
            }

            PublishAdd(text: "Añadir foto") {
                print("Añadir foto presionado")
            }
        }
        .padding()
    }
}
