//
//  PasswordRecoveryConfirmationScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla de confirmación de recuperación de contraseña.
/// Equivalente en SwiftUI al composable `PasswordRecoveryConfirmationScreen` de Jetpack Compose.
struct PasswordRecoveryConfirmationScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var email: String

    public init(email: String = "diego@correo.com") {
        self.email = email
    }

    private var message: AttributedString {
        "Si existe una cuenta asociada a \(email), recibirás instrucciones para restablecer tu contraseña."
            // .highlight(words: [email], color: InkLight)
            .highlight(words: [email], color: Color.roomie.ink)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image("mail_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)

            Text("Revisa tu correo")
                .font(.system(size: 32, weight: .regular, design: .serif))
                .frauncesFont(.regular, size: 32)
                .lineSpacing(8) // 40sp lineHeight - 32sp fontSize
                // .foregroundStyle(InkLight)
                .foregroundStyle(Color.roomie.ink)

            BasicText(message)
                .font(.system(size: 14, weight: .semibold))
                .dmSansFont(.semiBold, size: 14)
                .lineSpacing(6) // 20sp lineHeight - 14sp fontSize
                // .foregroundStyle(MuteLight)
                .foregroundStyle(Color.roomie.mute)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity, alignment: .center)

            BeigeButton(text: "Volver a iniciar sesión") {
                // navigate.back(AppDestinations.Home)
                router?.popToRoot()
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationStack {
        PasswordRecoveryConfirmationScreen()
    }
    .environment(NavigationRouter())
}
