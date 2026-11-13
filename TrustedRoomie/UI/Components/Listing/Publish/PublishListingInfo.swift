//
//  PublishListingInfo.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección del formulario de publicación para ingresar información básica del anuncio (título, descripción, zona y lugares).
/// Equivalente en SwiftUI al composable `PublishListingInfo` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishListingInfo: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding private var title: String
    @Binding private var descriptionText: String
    @Binding private var zone: String
    @Binding private var availablePlaces: String

    @State private var internalTitle: String = ""
    @State private var internalDescriptionText: String = ""
    @State private var internalZone: String = ""
    @State private var internalAvailablePlaces: String = ""

    private let isExternalBinding: Bool

    /// Inicializador con bindings externos para gestión de estado del formulario.
    public init(
        title: Binding<String>,
        description: Binding<String>,
        zone: Binding<String>,
        availablePlaces: Binding<String>
    ) {
        self._title = title
        self._descriptionText = description
        self._zone = zone
        self._availablePlaces = availablePlaces
        self.isExternalBinding = true
    }

    /// Inicializador por defecto con estado interno (equivalente directo a `PublishListingInfo()` en Compose).
    public init() {
        self._title = .constant("")
        self._descriptionText = .constant("")
        self._zone = .constant("")
        self._availablePlaces = .constant("")
        self.isExternalBinding = false
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if isExternalBinding {
                InputWithLabel(label: "Título del anuncio", placeHolder: "", text: $title)
                InputWithLabel(label: "Descripción", placeHolder: "", text: $descriptionText)
                InputWithLabel(label: "Zona", placeHolder: "", text: $zone)
                InputWithLabel(label: "Lugares disponibles", placeHolder: "", text: $availablePlaces)
            } else {
                InputWithLabel(label: "Título del anuncio", placeHolder: "", text: $internalTitle)
                InputWithLabel(label: "Descripción", placeHolder: "", text: $internalDescriptionText)
                InputWithLabel(label: "Zona", placeHolder: "", text: $internalZone)
                InputWithLabel(label: "Lugares disponibles", placeHolder: "", text: $internalAvailablePlaces)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PublishListingInfo()
            .padding()
    }
}
