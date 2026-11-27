//
//  ProfileScreenEmptyState.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Estado vacío para el perfil de un usuario no autenticado, invitándolo a iniciar sesión o registrarse.
/// Equivalente en SwiftUI al composable `ProfileEmptyState` de Jetpack Compose (`ui.screen.home.tabs`).
public struct ProfileEmptyState: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: LocalizedText
    public var subtitle: LocalizedText
    public var ctaText: LocalizedText
    public var onLoginTap: (() -> Void)?

    public init(
        title: LocalizedText = "profile.empty.title",
        subtitle: LocalizedText = "profile.empty.subtitle",
        ctaText: LocalizedText = "profile.empty.cta",
        onLoginTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.ctaText = ctaText
        self.onLoginTap = onLoginTap
    }

    
    public init(
        title: String,
        subtitle: String = "",
        ctaText: String = "",
        onLoginTap: (() -> Void)? = nil
    ) {
        self.init(
            title: LocalizedText(title),
            subtitle: LocalizedText(subtitle),
            ctaText: LocalizedText(ctaText),
            onLoginTap: onLoginTap
        )
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Contenedor circular con icono de perfil grande (64×64)
            ZStack {
                Circle()
                    .fill(Color.roomie.sand)
                    .frame(width: 64, height: 64)

                Image("ic_person_large")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(Color.roomie.mute)
            }
            .frame(width: 64, height: 64)

            Spacer().frame(height: 16)

            // Título
            title.text
                .font(.fraunces(.semiBold, size: 24))
                .lineSpacing(32 - 24)
                .foregroundStyle(Color.roomie.ink)
                .multilineTextAlignment(.center)

            Spacer().frame(height: 4)

            // Subtítulo
            subtitle.text
                .font(.dmSans(.regular, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.mute)
                .multilineTextAlignment(.center)
                .frame(width: 306)
                .padding(.bottom, 20)

            // Botón CTA
            GreenCTAButton(text: ctaText) {
                if let onLoginTap {
                    onLoginTap()
                } else {
                    router?.navigate(to: OnboardingRoute.Login)
                }
            }
            .frame(width: 300)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

// Typealiases para compatibilidad nominal con el archivo Kotlin (`ProfileScreenEmptyState.kt`).
public typealias ProfileScreenEmptyState = ProfileEmptyState

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ProfileEmptyState()
            .environment(NavigationRouter())
    }
}
