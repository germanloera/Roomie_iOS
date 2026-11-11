//
//  ListingMonthlyPaymentCard.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Modelo de datos para un elemento de pago mensual compartido.
public struct MonthlyPaymentItem: Identifiable, Hashable, Sendable {
    public var id: String { item }
    public var item: String
    public var amount: String

    public init(item: String, amount: String) {
        self.item = item
        self.amount = amount
    }
}

/// Tarjeta que muestra el desglose de pagos mensuales compartidos de un alojamiento.
/// Equivalente en SwiftUI al composable `ListingMonthlyPaymentCard` de Jetpack Compose.
public struct ListingMonthlyPaymentCard: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var label: String
    public var items: [MonthlyPaymentItem]

    public static let defaultItems: [MonthlyPaymentItem] = [
        MonthlyPaymentItem(item: "Renta total", amount: "22,000"),
        MonthlyPaymentItem(item: "Internet", amount: "600"),
        MonthlyPaymentItem(item: "Luz", amount: "900"),
        MonthlyPaymentItem(item: "Gas y agua", amount: "700")
    ]

    public init(
        label: String = "Pagos mensuales compartidos",
        items: [MonthlyPaymentItem] = defaultItems
    ) {
        self.label = label
        self.items = items
    }

    public var body: some View {
        BaseListingCardSection(label: label) {
            VStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, payment in
                    ListingMonthlySectionItem(
                        item: payment.item,
                        amount: payment.amount,
                        isLastItem: index == items.count - 1
                    )
                }
            }
        }
    }
}

/// Fila individual de concepto y monto de pago con línea divisoria opcional.
/// Equivalente en SwiftUI al composable `ListingMonthlySectionItem` de Jetpack Compose.
public struct ListingMonthlySectionItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var item: String
    public var amount: String
    public var isLastItem: Bool

    public init(
        item: String = "",
        amount: String = "",
        isLastItem: Bool = false
    ) {
        self.item = item
        self.amount = amount
        self.isLastItem = isLastItem
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                Text(item)
                    .font(.system(size: 14, weight: .regular))
                    .dmSansFont(.regular, size: 14)
                    .lineSpacing(20 - 14)
                    // .foregroundStyle(Color(red: 0x7A / 255.0, green: 0x83 / 255.0, blue: 0x7F / 255.0))
                    .foregroundStyle(Color.roomie.mute)

                Spacer()

                Text("$\(amount)")
                    .font(.system(size: 14, weight: .bold))
                    .dmSansFont(.semiBold, size: 14)
                    .lineSpacing(20 - 14)
                    // .foregroundStyle(Color(red: 0x1F / 255.0, green: 0x2A / 255.0, blue: 0x27 / 255.0))
                    .foregroundStyle(Color.roomie.ink)
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)

            if !isLastItem {
                Rectangle()
                    // .fill(Color(red: 0xE6 / 255.0, green: 0xDE / 255.0, blue: 0xCE / 255.0))
                    .fill(Color.roomie.line)
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ListingMonthlyPaymentCard()
        }
        .padding()
    }
}
