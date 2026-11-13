//
//  PublishSharedServices.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección de servicios compartidos para el flujo de publicación de alojamiento.
/// Equivalente en SwiftUI al composable `PublishSharedServices` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishSharedServices: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var items: Binding<[String]>?
    public var onItemsChanged: (([String]) -> Void)?

    public init(
        items: Binding<[String]>? = nil,
        onItemsChanged: (([String]) -> Void)? = nil
    ) {
        self.items = items
        self.onItemsChanged = onItemsChanged
    }

    public var body: some View {
        if let items {
            PublishAddPaymentSection(
                title: "Servicios compartidos",
                placeHolder: "Agrega los servicios que serán compartidos entre los ocupantes",
                items: items,
                onItemsChanged: onItemsChanged
            )
        } else {
            PublishAddPaymentSection(
                title: "Servicios compartidos",
                placeHolder: "Agrega los servicios que serán compartidos entre los ocupantes",
                onItemsChanged: onItemsChanged
            )
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            PublishSharedServices { services in
                print("Servicios compartidos: \(services)")
            }
        }
        .padding()
    }
}
