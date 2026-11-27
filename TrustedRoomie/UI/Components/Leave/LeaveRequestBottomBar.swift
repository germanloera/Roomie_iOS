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

    public var text: LocalizedText
    public var subtitle: LocalizedText
    public var iconName: String
    public var color: Color
    public var onLeaveTap: (() -> Void)?

    public init(
        text: LocalizedText = "roomies.leave_request.submit",
        subtitle: LocalizedText = "Esta acción requiere una confirmación final.",
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

    
    public init(
        text: String,
        subtitle: String = "",
        iconName: String = "exit_icon",
        color: Color = Color.roomie.pine,
        onLeaveTap: (() -> Void)? = nil
    ) {
        self.init(
            text: LocalizedText(text),
            subtitle: LocalizedText(subtitle),
            iconName: iconName,
            color: color,
            onLeaveTap: onLeaveTap
        )
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
