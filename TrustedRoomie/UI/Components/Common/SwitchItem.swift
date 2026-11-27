//
//  SwitchItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Componente de fila de configuración con interruptor (Switch/Toggle) alojado dentro de `BaseCard`.
/// Equivalente en SwiftUI al composable `SwitchItem` de Jetpack Compose (`ui.components.common`).
public struct SwitchItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: LocalizedText
    public var subtitle: LocalizedText
    public var icon: Image?
    public var iconBackground: Color
    public var iconTint: Color
    public var onCheckedChange: ((Bool) -> Void)?

    @Binding private var bindingIsOn: Bool
    @State private var internalIsOn: Bool = true
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        title: LocalizedText = "",
        subtitle: LocalizedText = "",
        icon: Image? = nil,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        isOn: Binding<Bool>,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self._bindingIsOn = isOn
        self.isExternalBinding = true
        self.onCheckedChange = onCheckedChange
    }

    /// Inicializador con Binding directo usando nombre de recurso en Assets.
    public init(
        title: LocalizedText = "",
        subtitle: LocalizedText = "",
        iconName: String,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        isOn: Binding<Bool>,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = Image(iconName)
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self._bindingIsOn = isOn
        self.isExternalBinding = true
        self.onCheckedChange = onCheckedChange
    }

    /// Inicializador con Binding directo usando SF Symbol.
    public init(
        title: LocalizedText = "",
        subtitle: LocalizedText = "",
        systemIcon: String,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        isOn: Binding<Bool>,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = Image(systemName: systemIcon)
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self._bindingIsOn = isOn
        self.isExternalBinding = true
        self.onCheckedChange = onCheckedChange
    }

    /// Inicializador con valor por defecto y callback opcional (equivalente directo a Compose).
    public init(
        title: LocalizedText = "",
        subtitle: LocalizedText = "",
        icon: Image? = nil,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        initialIsOn: Bool = true,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self._bindingIsOn = .constant(initialIsOn)
        self.isExternalBinding = false
        self._internalIsOn = State(initialValue: initialIsOn)
        self.onCheckedChange = onCheckedChange
    }

    /// Inicializador por conveniencia usando SF Symbol.
    public init(
        title: LocalizedText = "",
        subtitle: LocalizedText = "",
        systemIcon: String,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        initialIsOn: Bool = true,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = Image(systemName: systemIcon)
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self._bindingIsOn = .constant(initialIsOn)
        self.isExternalBinding = false
        self._internalIsOn = State(initialValue: initialIsOn)
        self.onCheckedChange = onCheckedChange
    }

    /// Inicializador por conveniencia usando nombre de recurso en Assets.
    public init(
        title: LocalizedText = "",
        subtitle: LocalizedText = "",
        iconName: String,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        initialIsOn: Bool = true,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = Image(iconName)
        self.iconBackground = iconBackground
        self.iconTint = iconTint
        self._bindingIsOn = .constant(initialIsOn)
        self.isExternalBinding = false
        self._internalIsOn = State(initialValue: initialIsOn)
        self.onCheckedChange = onCheckedChange
    }

    private var currentBinding: Binding<Bool> {
        if isExternalBinding {
            return Binding(
                get: { bindingIsOn },
                set: { newValue in
                    bindingIsOn = newValue
                    onCheckedChange?(newValue)
                }
            )
        } else {
            return Binding(
                get: { internalIsOn },
                set: { newValue in
                    internalIsOn = newValue
                    onCheckedChange?(newValue)
                }
            )
        }
    }

    
    public init(
        title: String,
        subtitle: String = "",
        icon: Image? = nil,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        isOn: Binding<Bool>,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.init(
            title: LocalizedText(title),
            subtitle: LocalizedText(subtitle),
            icon: icon,
            iconBackground: iconBackground,
            iconTint: iconTint,
            isOn: isOn,
            onCheckedChange: onCheckedChange
        )
    }

    public init(
        title: String,
        subtitle: String = "",
        systemIcon: String,
        iconBackground: Color = Color.roomie.pineContainer,
        iconTint: Color = Color.roomie.pine,
        isOn: Binding<Bool>,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.init(
            title: LocalizedText(title),
            subtitle: LocalizedText(subtitle),
            systemIcon: systemIcon,
            iconBackground: iconBackground,
            iconTint: iconTint,
            isOn: isOn,
            onCheckedChange: onCheckedChange
        )
    }

    public var body: some View {
        BaseCard(padding: 6) {
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
                    title.text
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink)

                    if !subtitle.isEmpty {
                        subtitle.text
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Toggle("", isOn: currentBinding)
                    .labelsHidden()
                    .tint(Color.roomie.pine)
            }
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 12) {
            SwitchItem(
                title: "Notificaciones push",
                subtitle: "Recibe avisos sobre nuevas publicaciones",
                systemIcon: "bell.badge.fill"
            )

            SwitchItem(
                title: "Modo oscuro automático",
                subtitle: "Sincronizar con el sistema",
                systemIcon: "moon.fill",
                initialIsOn: false
            )
        }
        .padding()
    }
}
