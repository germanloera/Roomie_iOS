//
//  LoginScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de inicio de sesión de TrustedRoomie.
/// Equivalente en SwiftUI al composable `LoginScreen` de Jetpack Compose (`ui.screen.onboarding`).
public struct LoginScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var email: String = ""
    @State private var password: String = ""

    public var onBackTap: (() -> Void)?
    public var onLoginSuccess: (() -> Void)?
    public var onForgotPasswordTap: (() -> Void)?
    public var onCreateAccountTap: (() -> Void)?

    public init(
        onBackTap: (() -> Void)? = nil,
        onLoginSuccess: (() -> Void)? = nil,
        onForgotPasswordTap: (() -> Void)? = nil,
        onCreateAccountTap: (() -> Void)? = nil
    ) {
        self.onBackTap = onBackTap
        self.onLoginSuccess = onLoginSuccess
        self.onForgotPasswordTap = onForgotPasswordTap
        self.onCreateAccountTap = onCreateAccountTap
    }

    public var body: some View {
        BaseScaffold(
            title: "",
            scrollable: true,
            onBackTap: onBackTap
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Image("home_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)

                Text("Comparte casa, con confianza")
                    .font(.fraunces(.regular, size: 32))
                    .lineSpacing(40 - 32)
                    .foregroundStyle(Color.roomie.ink)

                Text("Inicia sesión para contactar titulares, recibir invitaciones y ver reseñas verificadas.")
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)

                InputWithLabel(
                    label: "Correo electrónico",
                    placeHolder: "tu@correo.com",
                    text: $email
                )

                InputWithLabel(
                    label: "Contraseña",
                    placeHolder: "",
                    text: $password
                )

                Button {
                    if let onForgotPasswordTap {
                        onForgotPasswordTap()
                    } else {
                        router?.navigate(to: OnboardingRoute.PasswordRecovery(title: "Recuperar contraseña"))
                    }
                } label: {
                    Text("¿Olvidaste tu contraseña?")
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.pine)
                        .multilineTextAlignment(.center)
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity, alignment: .center)

                GreenCTAButton(text: "Iniciar sesión") {
                    if let onLoginSuccess {
                        onLoginSuccess()
                    } else {
                        router?.popToRoot()
                    }
                }
                .frame(maxWidth: .infinity)

                BeigeButton(text: "Crea tu cuenta") {
                    if let onCreateAccountTap {
                        onCreateAccountTap()
                    } else {
                        router?.navigate(to: OnboardingRoute.SignIn(title: "Crear cuenta"))
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    NavigationStack {
        LoginScreen()
    }
    .environment(NavigationRouter())
}
