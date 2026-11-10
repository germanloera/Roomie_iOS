//
//  ListingRulesCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Tarjeta que muestra la lista de reglas de convivencia del lugar.
/// Equivalente en SwiftUI al composable `ListingRulesCard` de Jetpack Compose.
public struct ListingRulesCard: View {
    public var label: String
    public var rules: [String]

    public static let defaultRules: [String] = [
        "Sin fiestas después de las 11 pm",
        "Limpieza semanal por turnos",
        "No fumar dentro",
        "Visitas avisadas en el grupo"
    ]

    public init(
        label: String = "Reglas del lugar",
        rules: [String] = defaultRules
    ) {
        self.label = label
        self.rules = rules
    }

    public var body: some View {
        BaseListingCardSection(label: label) {
            VStack(spacing: 0) {
                ForEach(Array(rules.enumerated()), id: \.offset) { _, rule in
                    ListingRuleItem(item: rule)
                }
            }
        }
    }
}

/// Elemento individual que representa una regla con icono de verificación y texto descriptivo.
/// Equivalente en SwiftUI al composable `ListingRuleItem` de Jetpack Compose.
public struct ListingRuleItem: View {
    public var item: String

    public init(item: String = "") {
        self.item = item
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 10) {
                Image("outline_check_24")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .padding(1)
                    .frame(width: 16, height: 16)
                    .foregroundStyle(Color(hex: 0x7A837F))

                Text(item)
                    .font(.system(size: 14, weight: .regular))
                    .dmSansFont(.regular, size: 14)
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color(hex: 0x7A837F))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ListingRulesCard()
        }
        .padding()
    }
}
