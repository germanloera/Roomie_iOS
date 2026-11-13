//
//  PublishRules.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección para agregar y gestionar las reglas del lugar en el formulario de publicación.
/// Equivalente en SwiftUI al composable `PublishRules` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishRules: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding private var rules: [String]
    private let isExternalBinding: Bool
    public var onRulesChanged: (([String]) -> Void)?

    /// Inicializador con binding externo para el formulario.
    public init(
        rules: Binding<[String]>,
        onRulesChanged: (([String]) -> Void)? = nil
    ) {
        self._rules = rules
        self.isExternalBinding = true
        self.onRulesChanged = onRulesChanged
    }

    /// Inicializador por defecto (equivalente a `PublishRules()` en Compose).
    public init(
        initialRules: [String] = [],
        onRulesChanged: (([String]) -> Void)? = nil
    ) {
        self._rules = .constant([])
        self.isExternalBinding = false
        self.onRulesChanged = onRulesChanged
    }

    public var body: some View {
        if isExternalBinding {
            PublishAddSection(
                title: "Reglas del lugar",
                placeHolder: "Agrega reglas para establecer expectativas claras.",
                items: $rules,
                onItemsChanged: onRulesChanged
            )
        } else {
            PublishAddSection(
                title: "Reglas del lugar",
                placeHolder: "Agrega reglas para establecer expectativas claras.",
                onItemsChanged: { updatedRules in
                    onRulesChanged?(updatedRules)
                }
            )
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PublishRules()
            .padding()
    }
}
