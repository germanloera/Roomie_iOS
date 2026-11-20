//
//  PasswordRecoveryScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de recuperación de contraseña de TrustedRoomie.
/// Equivalente en SwiftUI al composable `PasswordRecoveryScreen` de Jetpack Compose (`ui.screen.onboarding`).
public struct PasswordRecoveryScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var email: String = ""

    public var onBackTap: (() -> Void)?
    public var onSubmitTap: ((String) -> Void)?

    public init(
        onBackTap: (() -> Void)? = nil,
        onSubmitTap: ((String) -> Void)? = nil
    ) {
        self.onBackTap = onBackTap
        self.onSubmitTap = onSubmitTap
    }

    public var body: some View {
    
            VStack(alignment: .leading, spacing: 16) {
                Image("lock_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)

                Text("¿No recuerdas tu contraseña?")
                    .font(.fraunces(.regular, size: 32))
                    .lineSpacing(40 - 32)
                    .foregroundStyle(Color.roomie.ink)

                Text("Ingresa tu correo y te enviaremos las instrucciones para crear una nueva contraseña.")
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)

                InputWithLabel(
                    label: "Correo electrónico",
                    placeHolder: "tu@correo.com",
                    text: $email
                )

                GreenCTAButton(text: "Enviar instrucciones") {
                    if let onSubmitTap {
                        onSubmitTap(email)
                    } else {
                        // navigate.to(AppDestinations.PasswordRecoveryConfirmation)
                        router?.navigate(to: OnboardingRoute.PasswordRecoveryConfirmation)
                    }
                }
                .frame(maxWidth: .infinity)
            }
    }
}

#Preview {
    NavigationStack {
        PasswordRecoveryScreen()
    }
    .environment(NavigationRouter())
}
