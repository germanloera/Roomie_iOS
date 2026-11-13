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

    public var onSettingsTap: (() -> Void)?

    public init(onSettingsTap: (() -> Void)? = nil) {
        self.onSettingsTap = onSettingsTap
    }

    public var body: some View {
        VStack(spacing: 0) {
            ProfileHeader(onSettingsTap: onSettingsTap)

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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
                    // router?.navigate(to: AppDestinations.Settings) // La ruta Settings aún no existe en NavigationRouter
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
        .frame(height: 60)
        .padding(.top, 8)
    }
}

// Typealiases para compatibilidad nominal con el archivo Kotlin (`ProfileScreenContent.kt`).
public typealias ProfileScreenContent = ProfileSessionStartedState

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ProfileSessionStartedState()
            .padding(.horizontal, 20)
    }
}
