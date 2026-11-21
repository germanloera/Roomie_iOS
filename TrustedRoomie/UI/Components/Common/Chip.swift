//
//  Chip.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

public struct Chip: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var color: Color
    public var textColor: Color
    public var icon: Image?

    public init(
        text: String,
        color: Color = Color.roomie.pineContainer,
        textColor: Color = Color.roomie.onPineContainer,
        icon: Image? = nil
    ) {
        self.text = text
        self.color = color
        self.textColor = textColor
        self.icon = icon
    }

    public init(
        text: String,
        color: Color = Color.roomie.pineContainer,
        textColor: Color = Color.roomie.onPineContainer,
        systemIcon: String
    ) {
        self.text = text
        self.color = color
        self.textColor = textColor
        self.icon = Image(systemName: systemIcon)
    }

    public init(
        text: String,
        color: Color = Color.roomie.pineContainer,
        textColor: Color = Color.roomie.onPineContainer,
        iconName: String
    ) {
        self.text = text
        self.color = color
        self.textColor = textColor
        self.icon = Image(iconName)
    }

    public var body: some View {
        HStack(spacing: 4) {
            if let icon {
                icon
                    .renderingMode(.template)
                    .foregroundStyle(textColor)
            }

            Text(text)
                .font(.dmSans(.semiBold, size: 11))
                .lineSpacing(16.5 - 11)
                .foregroundStyle(textColor)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4) 
        .background(color)
        .clipShape(Capsule(style: .continuous))
       
        //.glassEffect(.regular.tint(color).interactive())
    }
}

/// Etiqueta verde (GreenChip) equivalente al composable `GreenChip` de Jetpack Compose.
public struct GreenChip: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var icon: Image?

    public init(text: String = "", icon: Image? = nil) {
        self.text = text
        self.icon = icon
    }

    public init(text: String = "", systemIcon: String) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
    }

    public init(text: String = "", iconName: String) {
        self.text = text
        self.icon = Image(iconName)
    }

    public var body: some View {
        Chip(
            text: text,
            color: Color.roomie.chipGreen,
            textColor: Color.roomie.chipGreenText,
            icon: icon
        )
    }
}

/// Etiqueta amarilla (YellowChip) equivalente al composable `YellowChip` de Jetpack Compose.
public struct YellowChip: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var icon: Image?

    public init(text: String = "", icon: Image? = nil) {
        self.text = text
        self.icon = icon
    }

    public init(text: String = "", systemIcon: String) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
    }

    public init(text: String = "", iconName: String) {
        self.text = text
        self.icon = Image(iconName)
    }

    public var body: some View {
        Chip(
            text: text,
            color: Color.roomie.chipYellow,
            textColor: Color.roomie.chipYellowText,
            icon: icon
        )
    }
}

/// Etiqueta estilo cristal (GlassChip) con borde fino, fondo translúcido y tipografía semibold.
/// Equivalente en SwiftUI al composable `GlassChip` de Jetpack Compose (`ui.components.common`).
public struct GlassChip: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var icon: Image?

    public init(text: String = "", icon: Image? = nil) {
        self.text = text
        self.icon = icon
    }

    public init(text: String = "", systemIcon: String) {
        self.text = text
        self.icon = Image(systemName: systemIcon)
    }

    public init(text: String = "", iconName: String) {
        self.text = text
        self.icon = Image(iconName)
    }

    public var body: some View {
        HStack(spacing: 6) {
            if let icon {
                icon
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(Color.roomie.ink)
            }

            Text(text)
                .font(.dmSans(.semiBold, size: 16))
                .lineSpacing(16 - 12)
                .foregroundStyle(Color.roomie.ink)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 6)
        .glassEffect(.regular.tint(Color.roomie.cardGlass).interactive())

    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            GreenChip(text: "Identidad verificada", systemIcon: "checkmark.shield.fill")
            YellowChip(text: "En revisión", systemIcon: "clock.fill")
            GlassChip(text: "Zona segura", systemIcon: "mappin.circle.fill")

            Chip(
                text: "Disponible",
                color: Color.roomie.pineContainer,
                textColor: Color.roomie.onPineContainer
            )

            Chip(
                text: "Amueblado",
                color: Color.roomie.cardGlass,
                textColor: Color.roomie.ink
            )
        }
        .padding()
    }
}
