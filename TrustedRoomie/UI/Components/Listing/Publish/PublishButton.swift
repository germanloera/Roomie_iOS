//
//  PublishButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Botón de acción para el flujo de publicación de alojamiento.
/// Equivalente en SwiftUI al composable `PublishButton` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var action: (() -> Void)?

    public init(
        title: String = "Publicar",
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        GreenCTAButton(text: title, onTap: action)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PublishButton {
            print("Publicar presionado")
        }
        .padding()
    }
}
