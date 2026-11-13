//
//  BottomCTAButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Barra de navegación / acción inferior fija que aloja un `GreenCTAButton` y un subtítulo opcional.
/// Equivalente en SwiftUI al composable `BottomCTAButton` de Jetpack Compose (`ui.components.common`).
public struct BottomCTAButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var subtitle: String?
    public var icon: Image?
    public var color: Color
    public var onTap: (() -> Void)?

    public init(
        text: String = "aaaaa",
        subtitle: String? = nil,
        icon: Image? = nil,
        color: Color = Color.roomie.pine,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.icon = icon
        self.color = color
        self.onTap = onTap
    }

    public init(
        text: String = "aaaaa",
        subtitle: String? = nil,
        systemIcon: String,
        color: Color = Color.roomie.pine,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.icon = Image(systemName: systemIcon)
        self.color = color
        self.onTap = onTap
    }

    public var body: some View {
        VStack(spacing: 4) {
            GreenCTAButton(
                text: text,
                icon: icon,
                color: color,
                onTap: onTap
            )

            if let subtitle, !subtitle.isEmpty {
                Text(subtitle)
                    .font(.dmSans(.regular, size: 11))
                    .lineSpacing(16.5 - 11)
                    .foregroundStyle(Color.roomie.pine)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(Color.roomie.paper)
        .overlay(alignment: .top) {
            Divider()
                .background(Color.roomie.cardBorder)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            Spacer()

            BottomCTAButton(
                text: "Reservar habitación",
                subtitle: "No se cobrará nada en este paso"
            )
        }
    }
}
