//
//  SendInviteBottomBar.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Barra inferior de acción fija para enviar invitación a un nuevo roomie o compañero.
/// Equivalente en SwiftUI al composable `SendInviteBottomBar` de Jetpack Compose (`ui.components.invite`).
public struct SendInviteBottomBar: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var iconName: String
    public var color: Color
    public var onSendTap: (() -> Void)?

    public init(
        text: String = "Enviar invitación",
        iconName: String = "outline_mail_24",
        color: Color = Color.roomie.pine,
        onSendTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.iconName = iconName
        self.color = color
        self.onSendTap = onSendTap
    }

    public var body: some View {
        BottomCTAButton(
            text: text,
            iconName: iconName,
            color: color
        ) {
            if let onSendTap {
                onSendTap()
            } else {
                router?.pop()
            }
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            Spacer()
            SendInviteBottomBar()
        }
    }
}
