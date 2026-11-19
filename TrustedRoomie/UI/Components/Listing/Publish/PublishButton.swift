//
//  PublishButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Botón inferior de acción para guardar cambios en el flujo de publicación de alojamiento.
/// Equivalente en SwiftUI al composable `PublishButton` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var color: Color
    public var action: (() -> Void)?

    public init(
        title: String = "Guardar Cambios",
        color: Color = Color.roomie.pine,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.color = color
        self.action = action
    }

    public var body: some View {
        BottomCTAButton(
            text: title,
            color: color
        ) {
            if let action {
                action()
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
            PublishButton()
        }
    }
}
