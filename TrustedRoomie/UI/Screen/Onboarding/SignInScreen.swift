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

                Text("auth.signin.title")
                    .font(.fraunces(.regular, size: 32))
                    .lineSpacing(40 - 32)
                    .foregroundStyle(Color.roomie.ink)

                Text("auth.signin.subtitle")
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)

                InputWithLabel(
                    label: "auth.signin.full_name",
                    placeHolder: "auth.signin.full_name_placeholder",
                    text: $fullName
                )

                InputWithLabel(
                    label: "auth.signin.email_label",
                    placeHolder: "auth.signin.email_placeholder",
                    text: $email
                )

                InputWithLabel(
                    label: "auth.signin.password_label",
                    placeHolder: "auth.signin.password_placeholder",
                    text: $password
                )

                GreenCTAButton(text: "auth.signin.cta") {
                    if let onSignUpSuccess {
                        onSignUpSuccess()
                    } else {
                        // navigate.back(AppDestinations.Home)
                        router?.popToRoot()
                    }
                }
                .frame(maxWidth: .infinity)

                Text("auth.signin.terms_notice")
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
