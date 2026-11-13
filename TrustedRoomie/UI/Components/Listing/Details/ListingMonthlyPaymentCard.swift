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
/// Equivalente en SwiftUI al composable `ListingMonthlyPaymentCard` de Jetpack Compose (`ui.components.listing.details`).
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
/// Equivalente en SwiftUI al composable `ListingMonthlySectionItem` de Jetpack Compose (`ui.components.listing.details`).
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
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.mute)

                Spacer()

                Text("$\(amount)")
                    .font(.dmSans(.semiBold, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.ink)
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)

            if !isLastItem {
                Rectangle()
                    .fill(Color.roomie.line)
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

public typealias ListingMontlyPaymentCardSeccion = ListingMonthlyPaymentCard
public typealias ListingMonthlyPaymentCardSeccion = ListingMonthlyPaymentCard
public typealias ListingMonthlyPaymentCardSection = ListingMonthlyPaymentCard

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
