//
//  PublishAdd.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Botón pequeño para agregar elementos en el flujo de publicación o acciones secundarias ("+ Agregar", "Ver mapa").
/// Equivalente en SwiftUI al composable `PublishAdd` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishAdd: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var icon: Image?
    public var onTap: (() -> Void)?

    public init(
        text: String = "Agregar",
        icon: Image? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = icon
        self.onTap = onTap
    }

    public init(
        text: String = "Agregar",
        iconName: String,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(iconName)
        self.onTap = onTap
    }

    public init(
        text: String = "Agregar",
        systemIcon: String,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 4) {
                if let icon {
                    icon
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(Color.roomie.pine)
                } else {
                    Image(systemName: "plus")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color.roomie.pine)
                }

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

            PublishAdd(text: "Ver mapa", iconName: "ic_explore") {
                print("Ver mapa presionado")
            }
        }
        .padding()
    }
}
