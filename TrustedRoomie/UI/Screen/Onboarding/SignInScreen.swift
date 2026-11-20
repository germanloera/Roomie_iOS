//
//  SignInScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de registro de usuario (Crear cuenta) en TrustedRoomie.
/// Equivalente en SwiftUI al composable `SignInScreen` de Jetpack Compose (`ui.screen.onboarding`).
@MainActor
public struct SignInScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    public var onBackTap: (() -> Void)?
    public var onSignUpSuccess: (() -> Void)?

    public init(
        onBackTap: (() -> Void)? = nil,
        onSignUpSuccess: (() -> Void)? = nil
    ) {
        self.onBackTap = onBackTap
        self.onSignUpSuccess = onSignUpSuccess
    }

    public var body: some View {
  
            VStack(alignment: .leading, spacing: 16) {
                Image("person_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)

                Text("Empieza a compartir con confianza")
                    .font(.fraunces(.regular, size: 32))
                    .lineSpacing(40 - 32)
                    .foregroundStyle(Color.roomie.ink)

                Text("Crea tu perfil para contactar titulares, recibir invitaciones y guardar tu historial.")
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)

                InputWithLabel(
                    label: "Nombre completo",
                    placeHolder: "Ej. Ana Martínez",
                    text: $fullName
                )

                InputWithLabel(
                    label: "Correo electrónico",
                    placeHolder: "tu@correo.com",
                    text: $email
                )

                InputWithLabel(
                    label: "Contraseña",
                    placeHolder: "Mínimo 8 caracteres",
                    text: $password
                )

                GreenCTAButton(text: "Crear cuenta") {
                    if let onSignUpSuccess {
                        onSignUpSuccess()
                    } else {
                        // navigate.back(AppDestinations.Home)
                        router?.popToRoot()
                    }
                }
                .frame(maxWidth: .infinity)

                Text("Al crear tu cuenta, aceptas recibir notificaciones sobre tus solicitudes e invitaciones.")
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.mute)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
       
        
    }
}

#Preview {
    NavigationStack {
        SignInScreen()
    }
    .environment(NavigationRouter())
}
