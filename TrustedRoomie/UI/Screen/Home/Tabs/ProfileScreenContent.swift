//
//  ProfileScreenContent.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Estado de perfil para un usuario con sesión iniciada, con encabezado, tarjeta de usuario, dirección, publicaciones, contacto, historial y reseñas.
/// Equivalente en SwiftUI al composable `ProfileSessionStartedState` de Jetpack Compose (`ui.screen.home.tabs`).
public struct ProfileSessionStartedState: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    public var id: Int = -1

    public var onSettingsTap: (() -> Void)?

    public init(onSettingsTap: (() -> Void)? = nil) {
        self.onSettingsTap = onSettingsTap
    }

  

    public init(id: Int = -1) {
        self.id = id
    }

    public var body: some View {
        VStack(spacing: 0) {
           // ProfileHeader(onSettingsTap: onSettingsTap)

            HomeTabHeader(id: id)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    UserCard()
                    ProfileCurrentAddress()
                    ProfileIsTenantInAddress()
                    ProfilePublishPlaceItem()
                    ProfileContactSection()
                    ProfileHistory()
                    ProfileReviewsSection()
                }
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)

        }
    }
}

/// Encabezado de la pestaña de perfil con título y botón de acceso a configuración.
/// Equivalente en SwiftUI al composable `ProfileHeader` de Jetpack Compose.
public struct ProfileHeader: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var onSettingsTap: (() -> Void)?

    public init(
        title: String = "Perfil",
        onSettingsTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.onSettingsTap = onSettingsTap
    }

    public var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.fraunces(.semiBold, size: 24))
                .lineSpacing(30 - 24)
                .foregroundStyle(Color.roomie.ink)

            Spacer()

            Button {
                if let onSettingsTap {
                    onSettingsTap()
                } else {
                    router?.navigate(to: SettingsRoute.Settings())
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.roomie.inputBackground)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Circle()
                                .stroke(Color.roomie.inputBorder, lineWidth: 1)
                        )

                    Image("settings_icon")
                        .renderingMode(.template)
                        .foregroundStyle(Color.roomie.ink)
                        .frame(width: 20, height: 20)
                }
                .frame(width: 40, height: 40)
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity)
    
    }
}

// Typealiases para compatibilidad nominal con el archivo Kotlin (`ProfileScreenContent.kt`).
public typealias ProfileScreenContent = ProfileSessionStartedState

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ProfileSessionStartedState(id: 0)
            .padding(.horizontal, 20)
    }
}
