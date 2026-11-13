//
//  ContactSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Sección de contacto del perfil de usuario con número de teléfono y contactos de emergencia.
/// Equivalente en SwiftUI al composable `ProfileContactSection` de Jetpack Compose (`ui.components.profile`).
public struct ProfileContactSection: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var phoneLabel: String
    public var phoneNumber: String
    public var emergencyTitle: String
    public var emergencyContactName: String
    public var emergencyContactRelation: String
    public var emergencyContactPhone: String

    public init(
        title: String = "Contacto",
        phoneLabel: String = "Teléfono",
        phoneNumber: String = "+52 55 2345 6789",
        emergencyTitle: String = "Contactos de emergencia",
        emergencyContactName: String = "Carlos Parra",
        emergencyContactRelation: String = "Hermano:",
        emergencyContactPhone: String = "+52 55 5432 1098"
    ) {
        self.title = title
        self.phoneLabel = phoneLabel
        self.phoneNumber = phoneNumber
        self.emergencyTitle = emergencyTitle
        self.emergencyContactName = emergencyContactName
        self.emergencyContactRelation = emergencyContactRelation
        self.emergencyContactPhone = emergencyContactPhone
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.dmSans(.extraBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            BaseCard {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        Image("ic_profile")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color.roomie.pine)

                        Text(phoneLabel)
                            .font(.dmSans(.regular, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.mute)

                        Spacer()

                        Text(phoneNumber)
                            .font(.dmSans(.semiBold, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.ink)
                    }
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)

                    Rectangle()
                        .fill(Color.roomie.line)
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(emergencyTitle.uppercased())
                            .font(.dmSans(.extraBold, size: 12))
                            .lineSpacing(16 - 12)
                            .kerning(0.3)
                            .foregroundStyle(Color.roomie.emergencyText)

                        HStack(spacing: 6) {
                            Text(emergencyContactName)
                                .font(.dmSans(.semiBold, size: 14))
                                .lineSpacing(20 - 14)
                                .foregroundStyle(Color.roomie.ink)

                            Spacer()

                            Text(emergencyContactRelation)
                                .font(.dmSans(.semiBold, size: 14))
                                .lineSpacing(20 - 14)
                                .foregroundStyle(Color.roomie.mute)

                            Text(emergencyContactPhone)
                                .font(.dmSans(.semiBold, size: 14))
                                .lineSpacing(20 - 14)
                                .foregroundStyle(Color.roomie.ink)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.roomie.emergencyContainer)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}

public typealias ContactSection = ProfileContactSection

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ProfileContactSection()
        }
        .padding()
    }
}
