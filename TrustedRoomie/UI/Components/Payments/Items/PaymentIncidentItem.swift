//
//  PaymentIncidentItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Tarjeta que representa una incidencia con detalle opcional y estado de pago vinculado.
/// Equivalente en SwiftUI al composable `PaymentIncidentItem` de Jetpack Compose (`ui.components.payments.items`).
public struct PaymentIncidentItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var categoryAndDate: String
    public var statusText: String
    public var descriptionText: String
    public var linkedPaymentStatusText: String
    public var linkedPaymentTitle: String
    public var linkedPaymentDetail: String
    public var showDescription: Bool

    public init(
        title: String = "Cristal roto en la sala",
        categoryAndDate: String = "Accidente · 8 jul",
        statusText: String = "Pendiente",
        descriptionText: String = "Se rompió el cristal de la ventana durante una visita. Se solicitó reemplazo.",
        linkedPaymentStatusText: String = "Sin pago vinculado",
        linkedPaymentTitle: String = "Pago único vinculado",
        linkedPaymentDetail: String = "$1,200 · vence 18 jul",
        showDescription: Bool = true
    ) {
        self.title = title
        self.categoryAndDate = categoryAndDate
        self.statusText = statusText
        self.descriptionText = descriptionText
        self.linkedPaymentStatusText = linkedPaymentStatusText
        self.linkedPaymentTitle = linkedPaymentTitle
        self.linkedPaymentDetail = linkedPaymentDetail
        self.showDescription = showDescription
    }

    public var body: some View {
        BaseCard(padding: 16) {
            VStack(alignment: .leading, spacing: 12) {
                // Cabecera de incidencia con icono, título y chip de estado
                HStack(alignment: .center, spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.roomie.sand)
                            .frame(width: 44, height: 44)

                        Image("shield_check")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .padding(1)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.roomie.warn)
                    }
                    .frame(width: 44, height: 44)

                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(.dmSans(.semiBold, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.ink)

                        Text(categoryAndDate)
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }

                    Spacer()

                    Chip(
                        text: statusText,
                        color: Color.roomie.sand,
                        textColor: Color.roomie.ink.opacity(0.7)
                    )
                }

                if showDescription {
                    Text(descriptionText)
                        .font(.dmSans(.regular, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink.opacity(0.75))

                    Text(linkedPaymentStatusText)
                        .font(.dmSans(.semiBold, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.ink.opacity(0.75))

                    // Tarjeta interna de pago único vinculado
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 8) {
                            Image("payments_icon")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .padding(1)
                                .frame(width: 16, height: 16)
                                .foregroundStyle(Color.roomie.pine)

                            Text(linkedPaymentTitle)
                                .font(.dmSans(.semiBold, size: 14))
                                .lineSpacing(20 - 14)
                                .foregroundStyle(Color.roomie.pine)
                        }

                        Text(linkedPaymentDetail)
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(Color.roomie.sand)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
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
            PaymentIncidentItem()
            PaymentIncidentItem(showDescription: false)
        }
        .padding()
    }
}
