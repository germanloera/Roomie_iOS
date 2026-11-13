//
//  SettingOptionItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Elemento de opción de configuración envuelto en una tarjeta (`BaseCard`).
/// Equivalente en SwiftUI al composable `SettingOptionItem` de Jetpack Compose (`ui.components.common`).
public struct SettingOptionItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var subtitle: String
    public var icon: Image?
    public var titleColor: Color
    public var iconBackground: Color
    public var iconTint: Color
    public var rightIcon: Image?
    public var onTap: (() -> Void)?

    public init(
        title: String = "",
        subtitle: String = "",
        icon: Image? = nil,
        titleColor: Color = Color.roomie.ink,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        rightIcon: Image? = Image(systemName: "chevron.right"),
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.titleColor = titleColor
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self.rightIcon = rightIcon
        self.onTap = onTap
    }

    public init(
        title: String = "",
        subtitle: String = "",
        systemIcon: String,
        titleColor: Color = Color.roomie.ink,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        rightIcon: Image? = Image(systemName: "chevron.right"),
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = Image(systemName: systemIcon)
        self.titleColor = titleColor
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self.rightIcon = rightIcon
        self.onTap = onTap
    }

    public init(
        title: String = "",
        subtitle: String = "",
        iconName: String,
        titleColor: Color = Color.roomie.ink,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        rightIcon: Image? = Image(systemName: "chevron.right"),
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = Image(iconName)
        self.titleColor = titleColor
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self.rightIcon = rightIcon
        self.onTap = onTap
    }

    public var body: some View {
        BaseCard(padding: 10) {
            SettingOptionItemContent(
                title: title,
                subtitle: subtitle,
                icon: icon,
                titleColor: titleColor,
                iconBackground: iconBackground,
                iconTint: iconTint,
                rightIcon: rightIcon,
                onTap: onTap
            )
        }
    }
}

/// Contenido interno del elemento de configuración con icono, textos y chevron.
/// Equivalente en SwiftUI a `SettingOptionItemContent` de Kotlin Compose.
public struct SettingOptionItemContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var subtitle: String
    public var icon: Image?
    public var titleColor: Color
    public var iconBackground: Color
    public var iconTint: Color
    public var rightIcon: Image?
    public var onTap: (() -> Void)?

    public init(
        title: String = "",
        subtitle: String = "",
        icon: Image? = nil,
        titleColor: Color = Color.roomie.ink,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        rightIcon: Image? = Image(systemName: "chevron.right"),
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.titleColor = titleColor
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self.rightIcon = rightIcon
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 12) {
                if let icon {
                    icon
                        .renderingMode(.template)
                        .foregroundStyle(iconTint)
                        .frame(width: 40, height: 40)
                        .background(iconBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(titleColor)

                    if !subtitle.isEmpty {
                        Text(subtitle)
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                if let rightIcon {
                    rightIcon
                        .renderingMode(.template)
                        .foregroundStyle(Color.roomie.mute)
                        .font(.system(size: 14, weight: .medium))
                }
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

        VStack(spacing: 12) {
            SettingOptionItem(
                title: "Notificaciones",
                subtitle: "Configura tus alertas y mensajes",
                systemIcon: "bell.fill"
            )

            SettingOptionItem(
                title: "Seguridad y privacidad",
                subtitle: "Contraseña y verificación en dos pasos",
                systemIcon: "lock.shield.fill"
            )

            SettingOptionItem(
                title: "Cerrar sesión",
                systemIcon: "arrow.backward.circle.fill",
                titleColor: Color.roomie.destructive,
                iconBackground: Color.roomie.destructive.opacity(0.12),
                iconTint: Color.roomie.destructive,
                rightIcon: nil
            )
        }
        .padding()
    }
}
