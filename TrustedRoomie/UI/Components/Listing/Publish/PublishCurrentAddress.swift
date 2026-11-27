//
//  PublishCurrentAddress.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Sección para ingresar la dirección del alojamiento durante el flujo de publicación, con aviso de privacidad.
/// Equivalente en SwiftUI al composable `PublishCurrentAddress` de Jetpack Compose (`ui.components.listing.publish`).
public struct PublishCurrentAddress: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var addressLine1: String
    @Binding public var addressLine2: String
    @Binding public var city: String
    @Binding public var state: String
    @Binding public var zipCode: String

    @State private var internalAddressLine1: String = ""
    @State private var internalAddressLine2: String = ""
    @State private var internalCity: String = ""
    @State private var internalState: String = ""
    @State private var internalZipCode: String = ""
    private let isExternalBinding: Bool

    /// Inicializador con Bindings directos (patrón estándar de SwiftUI).
    public init(
        addressLine1: Binding<String>,
        addressLine2: Binding<String>,
        city: Binding<String>,
        state: Binding<String>,
        zipCode: Binding<String>
    ) {
        self._addressLine1 = addressLine1
        self._addressLine2 = addressLine2
        self._city = city
        self._state = state
        self._zipCode = zipCode
        self.isExternalBinding = true
    }

    /// Inicializador por defecto con estado interno (equivalente directo a Compose).
    public init(
        addressLine1: String = "",
        addressLine2: String = "",
        city: String = "",
        state: String = "",
        zipCode: String = ""
    ) {
        self._addressLine1 = .constant("")
        self._addressLine2 = .constant("")
        self._city = .constant("")
        self._state = .constant("")
        self._zipCode = .constant("")
        self.isExternalBinding = false

        self._internalAddressLine1 = State(initialValue: addressLine1)
        self._internalAddressLine2 = State(initialValue: addressLine2)
        self._internalCity = State(initialValue: city)
        self._internalState = State(initialValue: state)
        self._internalZipCode = State(initialValue: zipCode)
    }

    private var currentAddress1: Binding<String> {
        isExternalBinding ? $addressLine1 : $internalAddressLine1
    }

    private var currentAddress2: Binding<String> {
        isExternalBinding ? $addressLine2 : $internalAddressLine2
    }

    private var currentCity: Binding<String> {
        isExternalBinding ? $city : $internalCity
    }

    private var currentState: Binding<String> {
        isExternalBinding ? $state : $internalState
    }

    private var currentZipCode: Binding<String> {
        isExternalBinding ? $zipCode : $internalZipCode
    }

    public var body: some View {
        BaseListingCardSection(label: "common.address") {
            VStack(alignment: .leading, spacing: 10) {
                InputWithLabel(
                    label: "common.address",
                    placeHolder: "6515 Yale St",
                    text: currentAddress1
                )

                InputWithLabel(
                    label: "common.address_2",
                    placeHolder: "Apt 123",
                    text: currentAddress2
                )

                InputWithLabel(
                    label: "City",
                    placeHolder: "Detroit",
                    text: currentCity
                )

                HStack(spacing: 12) {
                    InputWithLabel(
                        label: "State",
                        placeHolder: "MI",
                        text: currentState
                    )
                    .frame(maxWidth: .infinity)

                    InputWithLabel(
                        label: "Zip",
                        placeHolder: "00000",
                        text: currentZipCode
                    )
                    .frame(maxWidth: .infinity)
                }

                // Privacy notice banner
                HStack(alignment: .top, spacing: 8) {
                    Image("lock_white")
                        .renderingMode(.template)
                        .foregroundStyle(Color.roomie.pine)
                        .padding(.top, 2)

                    Text("listing.publish.address_disclaimer")
                        .font(.dmSans(.regular, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.pine)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(Color.roomie.pineContainer)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        ScrollView {
            PublishCurrentAddress()
                .padding()
        }
    }
}
