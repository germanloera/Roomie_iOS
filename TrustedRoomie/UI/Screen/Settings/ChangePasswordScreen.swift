//
//  ChangePasswordScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla de cambio de contraseña dentro de los ajustes del usuario.
/// Equivalente en SwiftUI al composable `ChangePasswordScreen` de Jetpack Compose (`ui.screen.settings`).
@MainActor
public struct ChangePasswordScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""

    public var onBackTap: (() -> Void)?
    public var onUpdatePasswordTap: ((String, String) -> Void)?

    public init(
        onBackTap: (() -> Void)? = nil,
        onUpdatePasswordTap: ((String, String) -> Void)? = nil
    ) {
        self.onBackTap = onBackTap
        self.onUpdatePasswordTap = onUpdatePasswordTap
    }

    public var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 13) {
                    Text(
                        "Elige una contraseña de al menos 8 caracteres que no uses en otros servicios."
                    )
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    InputWithLabel(
                        label: "Contraseña actual",
                        placeHolder: "",
                        text: $currentPassword,
                        isSecure: true
                    )

                    InputWithLabel(
                        label: "Nueva contraseña",
                        placeHolder: "Mínimo 8 caracteres",
                        text: $newPassword,
                        isSecure: true,
                        restrictions: [
                            .minLength(min: 8),
                            .hasUppercase(),
                            .hasDigit(),
                            .hasSpecialChar()
                        ],
                        onTextChanged: { text in newPassword = text}
                    )

                    InputWithLabel(
                        label: "Confirmar nueva contraseña",
                        placeHolder: "",
                        text: $confirmNewPassword,
                        isSecure: true,
                       restrictions:  [
                            .minLength(min: 8),
                            .hasUppercase(),
                            .hasDigit(),
                            .hasSpecialChar(),
                            .custom(id: "PASSWORD_MATCH", message: "Las contraseñas no coinciden", validator: { text in newPassword == text })
                        ]
                    )
                }
                .padding(.vertical, 10)
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    NavigationStack {
        ChangePasswordScreen()
    }
    .environment(NavigationRouter())
}
