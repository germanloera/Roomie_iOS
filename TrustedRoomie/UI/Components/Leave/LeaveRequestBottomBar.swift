//
//  LeaveRequestBottomBar.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Barra inferior de confirmación para solicitar la salida de una propiedad o habitación.
/// Equivalente en SwiftUI al composable `LeaveRequestBottomBar` de Jetpack Compose (`ui.components.leave`).
public struct LeaveRequestBottomBar: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: String
    public var subtitle: String
    public var iconName: String
    public var color: Color
    public var onLeaveTap: (() -> Void)?

    public init(
        text: String = "Solicitar mi salida",
        subtitle: String = "Esta acción requiere una confirmación final.",
        iconName: String = "exit_icon",
        color: Color = Color.roomie.pine,
        onLeaveTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.iconName = iconName
        self.color = color
        self.onLeaveTap = onLeaveTap
    }

    public var body: some View {
        BottomCTAButton(
            text: text,
            subtitle: subtitle,
            iconName: iconName,
            color: color
        ) {
            if let onLeaveTap {
                onLeaveTap()
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
            LeaveRequestBottomBar()
        }
    }
}
