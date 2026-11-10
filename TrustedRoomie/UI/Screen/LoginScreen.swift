//
//  LoginScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de inicio de sesión de TrustedRoomie.
/// Equivalente en SwiftUI al composable `LoginScreen` de Jetpack Compose.
struct LoginScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("home_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)

            Text("Comparte casa, con confianza")
                .font(.system(size: 32, weight: .regular, design: .serif))
                .frauncesFont(.regular, size: 32)
                .lineSpacing(8) // 40sp lineHeight - 32sp fontSize
                // .foregroundStyle(InkLight)
                .foregroundStyle(Color.roomie.ink)

            Text("Inicia sesión para contactar titulares, recibir invitaciones y ver reseñas verificadas.")
                .font(.system(size: 14, weight: .regular))
                .dmSansFont(.regular, size: 14)
                .lineSpacing(6) // 20sp lineHeight - 14sp fontSize
                // .foregroundStyle(MuteLight)
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
                // navigate.to(AppDestinations.PasswordRecovery)
                router?.navigate(to: OnboardingRoute.PasswordRecovery(title: ""))
            } label: {
                Text("¿Olvidaste tu contraseña?")
                    .font(.system(size: 14, weight: .semibold))
                    .dmSansFont(.semiBold, size: 14)
                    .lineSpacing(6) // 20sp lineHeight - 14sp fontSize
                    // .foregroundStyle(PinePrimaryLight)
                    .foregroundStyle(Color.roomie.pine)
                    .multilineTextAlignment(.center)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, alignment: .center)

            GreenCTAButton(text: "Iniciar sesión") {
                // navigate.back(AppDestinations.Home)
                // Fire Login
                router?.popToRoot()
                
            }
            .frame(maxWidth: .infinity)

            BeigeButton(text: "Crea tu cuenta") {
                // navigate.to(AppDestinations.SignIn)
                router?.navigate(to: OnboardingRoute.SignIn(title: ""))
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationStack {
        LoginScreen()
            .bg()
    }
    .environment(NavigationRouter())
}
