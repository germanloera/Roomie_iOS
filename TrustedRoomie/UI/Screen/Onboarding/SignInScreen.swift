//
//  SignInScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de registro de usuario (Crear cuenta) en TrustedRoomie.
/// Equivalente en SwiftUI al composable `SignInScreen` de Jetpack Compose.
struct SignInScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("person_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)

            Text("Empieza a compartir con confianza")
                .font(.system(size: 32, weight: .regular, design: .serif))
                .frauncesFont(.regular, size: 32)
                .lineSpacing(8) // 40sp lineHeight - 32sp fontSize
                // .foregroundStyle(InkLight)
                .foregroundStyle(Color.roomie.ink)

            Text("Crea tu perfil para contactar titulares, recibir invitaciones y guardar tu historial.")
                .font(.system(size: 14, weight: .regular))
                .dmSansFont(.regular, size: 14)
                .lineSpacing(6) // 20sp lineHeight - 14sp fontSize
                // .foregroundStyle(MuteLight)
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
                // navigate.back(AppDestinations.Home)
                router?.popToRoot()
            }
            .frame(maxWidth: .infinity)

            Text("Al crear tu cuenta, aceptas recibir notificaciones sobre tus solicitudes e invitaciones.")
                .font(.system(size: 12, weight: .regular))
                .dmSansFont(.regular, size: 12)
                .lineSpacing(4) // 16sp lineHeight - 12sp fontSize
                // .foregroundStyle(MuteLight)
                .foregroundStyle(Color.roomie.mute)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationStack {
        SignInScreen()
            .bg()
    }
    .environment(NavigationRouter())
}
