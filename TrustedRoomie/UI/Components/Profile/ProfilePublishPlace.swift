//
//  ProfilePublishPlace.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Opción dentro del perfil para publicar un lugar y convertirse en titular.
/// Equivalente en SwiftUI al composable `ProfilePublishPlaceItem` de Jetpack Compose (`ui.components.profile`).
public struct ProfilePublishPlaceItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var headerTitle: String
    public var optionTitle: String
    public var optionSubtitle: String
    public var iconName: String
    public var onTap: (() -> Void)?

    public init(
        headerTitle: String = "¿Tienes un lugar disponible?",
        optionTitle: String = "Publicar mi lugar",
        optionSubtitle: String = "Crea un anuncio y conviértete en titular",
        iconName: String = "home_icon",
        onTap: (() -> Void)? = nil
    ) {
        self.headerTitle = headerTitle
        self.optionTitle = optionTitle
        self.optionSubtitle = optionSubtitle
        self.iconName = iconName
        self.onTap = onTap
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(headerTitle.uppercased())
                .font(.dmSans(.extraBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            SettingOptionItem(
                title: optionTitle,
                subtitle: optionSubtitle,
                iconName: iconName,
                iconBackground: Color.roomie.pine,
                iconTint: Color.roomie.pineContainer,
                rightIcon: nil
            ) {
                if let onTap {
                    onTap()
                } else {
                    router?.navigate(to: HomeRoute.ProfilePublishPlace())
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

public typealias ProfilePublishPlace = ProfilePublishPlaceItem

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ProfilePublishPlaceItem()
        }
        .padding()
    }
}
