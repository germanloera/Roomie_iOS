//
//  PaymentRoomieItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Elemento de fila para mostrar el estado de pago individual de un roomie con avatar, nombre, cuota y chip de acción.
/// Equivalente en SwiftUI al composable `PaymentRoomieItem` de Jetpack Compose (`ui.components.payments.items`).
public struct PaymentRoomieItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var initial: String
    public var name: String
    public var amount: String
    public var chipText: String
    public var isLast: Bool
    public var onChipTap: (() -> Void)?

    public init(
        initial: String = "M",
        name: String = "Mariana",
        amount: String = "$4,125",
        chipText: String = "Notificar Pago",
        isLast: Bool = false,
        onChipTap: (() -> Void)? = nil
    ) {
        self.initial = initial
        self.name = name
        self.amount = amount
        self.chipText = chipText
        self.isLast = isLast
        self.onChipTap = onChipTap
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                // Avatar circular con inicial
                ZStack {
                    Circle()
                        .fill(Color.roomie.warn)
                        .frame(width: 30, height: 30)

                    Text(initial)
                        .font(.dmSans(.semiBold, size: 11.4))
                        .lineSpacing(17.1 - 11.4)
                        .foregroundStyle(Color.roomie.messageText)
                }
                .frame(width: 30, height: 30)

                // Nombre y monto
                VStack(alignment: .leading, spacing: 0) {
                    Text(name)
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink)

                    Text(amount)
                        .font(.dmSans(.regular, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.mute)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Chip de acción o estado
                Button {
                    onChipTap?()
                } label: {
                    Chip(
                        text: chipText,
                        color: Color.roomie.pine,
                        textColor: Color.roomie.line
                    )
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)

            if !isLast {
                Rectangle()
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

        VStack(spacing: 0) {
            PaymentRoomieItem()
            PaymentRoomieItem(initial: "J", name: "Juan", amount: "$4,125", isLast: true)
        }
        .padding()
    }
}
