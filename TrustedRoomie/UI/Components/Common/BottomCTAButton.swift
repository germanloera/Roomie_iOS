//
//  BottomCTAButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Barra de navegación / acción inferior fija que aloja un `GreenCTAButton` o `RedCTAButton` y un subtítulo opcional.
/// Equivalente en SwiftUI al composable `BottomCTAButton` de Jetpack Compose (`ui.components.common`).
public struct BottomCTAButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var subtitle: String?
    public var icon: Image?
    public var color: Color
    public var isEmergency: Bool
    public var onTap: (() -> Void)?

    public init(
        text: String = "aaaaa",
        subtitle: String? = nil,
        icon: Image? = nil,
        color: Color = Color.roomie.pine,
        isEmergency: Bool = false,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.icon = icon
        self.color = color
        self.isEmergency = isEmergency
        self.onTap = onTap
    }

    public init(
        text: String = "aaaaa",
        subtitle: String? = nil,
        systemIcon: String,
        color: Color = Color.roomie.pine,
        isEmergency: Bool = false,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.icon = Image(systemName: systemIcon)
        self.color = color
        self.isEmergency = isEmergency
        self.onTap = onTap
    }

    public init(
        text: String = "aaaaa",
        subtitle: String? = nil,
        iconName: String,
        color: Color = Color.roomie.pine,
        isEmergency: Bool = false,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.icon = Image(iconName)
        self.color = color
        self.isEmergency = isEmergency
        self.onTap = onTap
    }

    private var subtitleTextColor: Color {
        isEmergency ? Color.roomie.emergencyText : Color.roomie.pine
    }

    public var body: some View {
        VStack(spacing: 4) {
            if isEmergency {
                RedCTAButton(
                    text: text,
                    icon: icon,
                    onTap: onTap
                )
            } else {
                GreenCTAButton(
                    text: text,
                    icon: icon,
                    color: color,
                    onTap: onTap
                )
            }

            if let subtitle, !subtitle.isEmpty {
                Text(subtitle)
                    .font(.dmSans(.regular, size: 11))
                    .lineSpacing(16.5 - 11)
                    .foregroundStyle(subtitleTextColor)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(Color.roomie.paper)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color.roomie.inputBorder)
                .frame(height: 1)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            BottomCTAButton(
                text: "Continuar con la solicitud",
                subtitle: "Sin cobro inicial hasta ser aceptado"
            )

            BottomCTAButton(
                text: "Reportar emergencia",
                subtitle: "Se notificará de inmediato",
                isEmergency: true
            )
        }
    }
}
