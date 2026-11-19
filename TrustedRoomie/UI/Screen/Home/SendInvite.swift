//
//  SendInvite.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pantalla para enviar una invitación a un inquilino a unirse a un departamento.
/// Equivalente en SwiftUI al composable `SendInvite` de Jetpack Compose (`ui.screen.home`).
@MainActor
public struct SendInvite: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var entryDate: String = ""
    @State private var welcomeMessage: String = ""

    public var initial: String
    public var name: String
    public var role: String
    public var listingItem: ListingCardItem
    public var onBackTap: (() -> Void)?
    public var onSendInviteTap: (() -> Void)?
    public var onListingTap: (() -> Void)?

    public init(
        initial: String = "DF",
        name: String = "Diego Fernández",
        role: String = "Inquilino",
        listingItem: ListingCardItem = ListingCardItem(
            title: "Cuarto luminoso en la Roma Norte",
            location: "Roma Norte, CDMX",
            price: "$6,500",
            roommateCount: "4 roomies"
        ),
        onBackTap: (() -> Void)? = nil,
        onSendInviteTap: (() -> Void)? = nil,
        onListingTap: (() -> Void)? = nil
    ) {
        self.initial = initial
        self.name = name
        self.role = role
        self.listingItem = listingItem
        self.onBackTap = onBackTap
        self.onSendInviteTap = onSendInviteTap
        self.onListingTap = onListingTap
    }

    public var body: some View {
        BaseScaffold(
            title: "Enviar invitación",
            scrollable: true,
            onBackTap: onBackTap,
            bottomBar: {
                SendInviteBottomBar(onSendTap: onSendInviteTap)
            }
        ) {
            VStack(alignment: .leading, spacing: 10) {
                // Tarjeta de información del inquilino
                BaseCard {
                    HStack(alignment: .center, spacing: 8) {
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

                        VStack(alignment: .leading, spacing: 0) {
                            Text(name)
                                .font(.dmSans(.semiBold, size: 14))
                                .lineSpacing(20 - 14)
                                .foregroundStyle(Color.roomie.ink)

                            Text(role)
                                .font(.dmSans(.regular, size: 12))
                                .lineSpacing(16 - 12)
                                .foregroundStyle(Color.roomie.mute)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Tarjeta de la publicación asociada
                ExploreListingCard(
                    item: listingItem,
                    hideAvailability: true
                ) {
                    if let onListingTap {
                        onListingTap()
                    } else {
                        router?.navigate(to: ListingRoute.ListingDetail(title: listingItem.title))
                        // router?.navigate(to: AppDestinations.ListingDetails) // Estructura según Regla 5
                    }
                }

                // Tarjeta de aviso aclaratorio
                VStack(alignment: .leading, spacing: 0) {
                    Text("Solo notificas al titular. El titular debe definir la fecha y aceptar la salida antes de que puedas confirmarla.")
                        .font(.dmSans(.regular, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink.opacity(0.7))
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.roomie.sand)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                // Campo fecha de entrada
                InputWithLabel(
                    label: "Fecha de entrada propuesta",
                    text: $entryDate
                )

                // Campo mensaje de bienvenida
                InputWithLabel(
                    label: "Mensaje de bienvenida",
                    lines: 5,
                    text: $welcomeMessage
                )

                // Mensaje informativo con escudo
                HStack(alignment: .top, spacing: 8) {
                    Image("shield_check")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(Color.roomie.pine)
                        .padding(1)

                    Text("El usuario podrá revisar los acuerdos y aceptar o rechazar la invitación. Hasta entonces, no se une al departamento.")
                        .font(.dmSans(.regular, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.pine)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.roomie.inviteNoticeBackground)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.roomie.cardGlass, lineWidth: 1)
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SendInvite()
        .environment(NavigationRouter())
}
