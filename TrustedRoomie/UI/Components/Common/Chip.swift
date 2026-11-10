//
//  Chip.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Componente de etiqueta compacta (Chip/Badge) con bordes redondeados y colores configurables.
/// Equivalente en SwiftUI al composable `Chip` de Jetpack Compose.
public struct Chip: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var color: Color
    public var textColor: Color

    public init(
        text: String,
        color: Color = Color.roomie.pineContainer,
        textColor: Color = Color.roomie.onPineContainer
    ) {
        self.text = text
        self.color = color
        self.textColor = textColor
    }

    public var body: some View {
        Text(text)
            .font(.system(size: 11, weight: .semibold))
            .dmSansFont(.semiBold, size: 11)
            .lineSpacing(5.5) // 16.5sp lineHeight - 11sp fontSize
            .foregroundStyle(textColor)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color)
            .clipShape(Capsule(style: .continuous))
    }
}

/// Etiqueta verde (GreenChip) equivalente al composable de Compose.
public typealias GreenChip = Chip

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            Chip(
                text: "Disponible",
                color: Color.roomie.pineContainer,
                textColor: Color.roomie.onPineContainer
            )

            Chip(
                text: "Amueblado",
                color: Color(argb: 0x8CFFFFFF),
                // textColor: Color(hex: 0x1F2A27)
                textColor: Color.roomie.ink
            )

            Chip(
                text: "Servicios incluidos",
                color: Color.roomie.clayContainer,
                textColor: Color.roomie.onClayContainer
            )
        }
        .padding()
    }
}
