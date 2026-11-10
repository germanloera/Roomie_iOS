//
//  BaseListingCardSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Sección base para tarjetas de listing con etiqueta de encabezado en mayúsculas y contenedor BaseCard.
/// Equivalente en SwiftUI al composable `BaseListingCardSection` de Jetpack Compose.
public struct BaseListingCardSection<Content: View>: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var label: String
    public var content: Content?

    public init(
        label: String = "",
        @ViewBuilder content: () -> Content
    ) {
        self.label = label
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !label.isEmpty {
                Text(label.uppercased())
                    .font(.system(size: 13, weight: .bold))
                    .dmSansFont(.semiBold, size: 13)
                    .lineSpacing(19.5 - 13)
                    .kerning(0.65)
                    // .foregroundStyle(Color(red: 0x7A / 255.0, green: 0x83 / 255.0, blue: 0x7F / 255.0))
                    .foregroundStyle(Color.roomie.mute)
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
        self.content = nil
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            BaseListingCardSection(label: "Reglas de convivencia") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("No fumar en áreas comunes")
                        .font(.body)
                        // .foregroundStyle(InkLight)
                        .foregroundStyle(Color.roomie.ink)

                    Text("Silencio después de las 11:00 PM")
                        .font(.body)
                        // .foregroundStyle(InkLight)
                        .foregroundStyle(Color.roomie.ink)
                }
            }
        }
        .padding()
    }
}
