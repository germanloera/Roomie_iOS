//
//  PasswordRecoveryScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de recuperación de contraseña de TrustedRoomie.
/// Equivalente en SwiftUI al composable `PasswordRecoveryScreen` de Jetpack Compose.
struct PasswordRecoveryScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var email: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("lock_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)

            Text("¿No recuerdas tu contraseña?")
                .font(.system(size: 32, weight: .regular, design: .serif))
                .frauncesFont(.regular, size: 32)
                .lineSpacing(8) // 40sp lineHeight - 32sp fontSize
                // .foregroundStyle(InkLight)
                .foregroundStyle(Color.roomie.ink)

            Text("Ingresa tu correo y te enviaremos las instrucciones para crear una nueva contraseña.")
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

            GreenCTAButton(text: "Enviar instrucciones") {
                // navigate.to(AppDestinations.PasswordRecoveryConfirmation)
                router?.navigate(to: OnboardingRoute.PasswordRecoveryConfirmation(title: ""))
               
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationStack {
        PasswordRecoveryScreen()
            .bg()
    }
    .environment(NavigationRouter())
}
