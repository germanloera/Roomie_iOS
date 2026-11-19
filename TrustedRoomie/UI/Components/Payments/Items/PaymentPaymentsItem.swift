//
//  PaymentPaymentsItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Modelo para los detalles de pago de un roomie dentro de la tarjeta general de pago.
public struct RoomiePaymentEntry: Identifiable, Hashable, Sendable {
    public let id: String
    public var initial: String
    public var name: String
    public var amount: String
    public var chipText: String

    public init(
        id: String = UUID().uuidString,
        initial: String,
        name: String,
        amount: String,
        chipText: String = "Notificar Pago"
    ) {
        self.id = id
        self.initial = initial
        self.name = name
        self.amount = amount
        self.chipText = chipText
    }
}

/// Tarjeta principal de resumen de pago (ej. renta) con desglose opcional por cada roomie ocupante.
/// Equivalente en SwiftUI al composable `PaymentPaymentsItem` de Jetpack Compose (`ui.components.payments.items`).
public struct PaymentPaymentsItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var dueDate: String
    public var totalAmount: String
    public var showUserDetail: Bool
    public var roomies: [RoomiePaymentEntry]
    public var onRoomieChipTap: ((RoomiePaymentEntry) -> Void)?

    public static let defaultRoomies: [RoomiePaymentEntry] = [
        RoomiePaymentEntry(initial: "M", name: "Mariana", amount: "$4,125"),
        RoomiePaymentEntry(initial: "A", name: "Alejandro", amount: "$4,125"),
        RoomiePaymentEntry(initial: "S", name: "Sofía", amount: "$4,125"),
        RoomiePaymentEntry(initial: "C", name: "Carlos", amount: "$4,125")
    ]

    public init(
        title: String = "Renta julio",
        dueDate: String = "Vence 5 jul",
        totalAmount: String = "$16,500",
        showUserDetail: Bool = true,
        roomies: [RoomiePaymentEntry] = defaultRoomies,
        onRoomieChipTap: ((RoomiePaymentEntry) -> Void)? = nil
    ) {
        self.title = title
        self.dueDate = dueDate
        self.totalAmount = totalAmount
        self.showUserDetail = showUserDetail
        self.roomies = roomies
        self.onRoomieChipTap = onRoomieChipTap
    }

    private var titleFont: Font {
        if showUserDetail {
            return .fraunces(.semiBold, size: 20)
        } else {
            return .dmSans(.semiBold, size: 20)
        }
    }

    public var body: some View {
        BaseCard(padding: 16) {
            VStack(alignment: .leading, spacing: 12) {
                // Fila de encabezado: concepto + fecha vs monto total
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(titleFont)
                            .lineSpacing(28 - 20)
                            .foregroundStyle(Color.roomie.ink)

                        Text(dueDate)
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }

                    Spacer()

                    Text(totalAmount)
                        .font(.dmSans(.extraBold, size: 16))
                        .lineSpacing(24 - 16)
                        .foregroundStyle(Color.roomie.ink)
                        .multilineTextAlignment(.trailing)
                }
                .frame(maxWidth: .infinity)

                // Desglose opcional por usuario
                if showUserDetail {
                    VStack(spacing: 0) {
                        ForEach(Array(roomies.enumerated()), id: \.element.id) { index, roomie in
                            PaymentRoomieItem(
                                initial: roomie.initial,
                                name: roomie.name,
                                amount: roomie.amount,
                                chipText: roomie.chipText,
                                isLast: index == roomies.count - 1
                            ) {
                                onRoomieChipTap?(roomie)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            PaymentPaymentsItem()
            PaymentPaymentsItem(showUserDetail: false)
        }
        .padding()
    }
}
