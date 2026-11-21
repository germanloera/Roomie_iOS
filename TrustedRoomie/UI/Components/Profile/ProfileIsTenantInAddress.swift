//
//  ProfileIsTenantInAddress.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección en el perfil de usuario para indicar si habita actualmente en la propiedad configurada.
/// Equivalente en SwiftUI al composable `ProfileIsTenantInAddress` de Jetpack Compose (`ui.components.profile`).
public struct ProfileIsTenantInAddress: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var switchTitle: String
    public var switchSubtitle: String
    public var iconName: String
    public var onCheckedChange: ((Bool) -> Void)?

    @Binding private var bindingIsLivingHere: Bool
    @State private var internalIsLivingHere: Bool = true
    private let isExternalBinding: Bool

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        title: String = "Vivienda",
        switchTitle: String = "Vivo en esta propiedad",
        switchSubtitle: String = "Incluye mi aportación en los servicios",
        iconName: String = "house",
        isLivingHere: Binding<Bool>,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.switchTitle = switchTitle
        self.switchSubtitle = switchSubtitle
        self.iconName = iconName
        self._bindingIsLivingHere = isLivingHere
        self.isExternalBinding = true
        self.onCheckedChange = onCheckedChange
    }

    /// Inicializador con valor por defecto y callback opcional (equivalente directo a Compose).
    public init(
        title: String = "Vivienda",
        switchTitle: String = "Vivo en esta propiedad",
        switchSubtitle: String = "Incluye mi aportación en los servicios",
        iconName: String = "house",
        initialIsLivingHere: Bool = true,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.switchTitle = switchTitle
        self.switchSubtitle = switchSubtitle
        self.iconName = iconName
        self._bindingIsLivingHere = .constant(initialIsLivingHere)
        self.isExternalBinding = false
        self._internalIsLivingHere = State(initialValue: initialIsLivingHere)
        self.onCheckedChange = onCheckedChange
    }

    private var currentBinding: Binding<Bool> {
        if isExternalBinding {
            return Binding(
                get: { bindingIsLivingHere },
                set: { newValue in
                    bindingIsLivingHere = newValue
                    onCheckedChange?(newValue)
                }
            )
        } else {
            return Binding(
                get: { internalIsLivingHere },
                set: { newValue in
                    internalIsLivingHere = newValue
                    onCheckedChange?(newValue)
                }
            )
        }
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text(title.uppercased())
                .font(.dmSans(.extraBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            SwitchItem(
                title: switchTitle,
                subtitle: switchSubtitle,
                systemIcon: iconName,
                isOn: currentBinding,
                onCheckedChange: onCheckedChange
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ProfileIsTenantInAddress()
        }
        .padding()
    }
}
