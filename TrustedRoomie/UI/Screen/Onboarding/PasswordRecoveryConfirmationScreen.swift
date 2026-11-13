//
//  PasswordRecoveryConfirmationScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de confirmación de recuperación de contraseña.
/// Equivalente en SwiftUI al composable `PasswordRecoveryConfirmationScreen` de Jetpack Compose (`ui.screen.onboarding`).
public struct PasswordRecoveryConfirmationScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var email: String
    public var onBackTap: (() -> Void)?
    public var onBackToLoginTap: (() -> Void)?

    public init(
        email: String = "diego@correo.com",
        onBackTap: (() -> Void)? = nil,
        onBackToLoginTap: (() -> Void)? = nil
    ) {
        self.email = email
        self.onBackTap = onBackTap
        self.onBackToLoginTap = onBackToLoginTap
    }

    private var message: AttributedString {
        "Si existe una cuenta asociada a \(email), recibirás instrucciones para restablecer tu contraseña."
            .highlight(words: [email], color: Color.roomie.ink)
    }

    public var body: some View {
        BaseScaffold(
            title: "Recuperar contraseña",
            scrollable: true,
            onBackTap: onBackTap
        ) {
            VStack(alignment: .center, spacing: 16) {
                Image("mail_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)

                Text("Revisa tu correo")
                    .font(.fraunces(.regular, size: 32))
                    .lineSpacing(40 - 32)
                    .foregroundStyle(Color.roomie.ink)

                BasicText(message)
                    .font(.dmSans(.semiBold, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .frame(maxWidth: .infinity, alignment: .center)

                BeigeButton(text: "Volver a iniciar sesión") {
                    if let onBackToLoginTap {
                        onBackToLoginTap()
                    } else {
                        // navigate.back(AppDestinations.Home)
                        router?.popToRoot()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    NavigationStack {
        PasswordRecoveryConfirmationScreen()
    }
    .environment(NavigationRouter())
}
