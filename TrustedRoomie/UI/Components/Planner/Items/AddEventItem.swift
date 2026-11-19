//
//  AddEventItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Tarjeta para agregar un nuevo evento con campos de fecha, hora y botón CTA verde de ancho completo.
/// Equivalente en SwiftUI al composable `AddEventItem` de Jetpack Compose (`ui.components.planner.items`).
public struct AddEventItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var datePlaceholder: String
    public var timePlaceholder: String
    public var buttonText: String
    public var onAddTap: ((String, String) -> Void)?

    @State private var dateText: String = ""
    @State private var timeText: String = ""

    public init(
        title: String = "Nuevo evento",
        datePlaceholder: String = "Fecha",
        timePlaceholder: String = "Hora",
        buttonText: String = "Inicia sesión para contactar",
        onAddTap: ((String, String) -> Void)? = nil
    ) {
        self.title = title
        self.datePlaceholder = datePlaceholder
        self.timePlaceholder = timePlaceholder
        self.buttonText = buttonText
        self.onAddTap = onAddTap
    }

    public var body: some View {
        BaseCard(padding: 16) {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.dmSans(.regular, size: 15))
                    .foregroundStyle(Color.roomie.mute)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)

                HStack(alignment: .top, spacing: 8) {
                    Input(
                        placeHolder: datePlaceholder,
                        text: $dateText
                    )
                    .frame(maxWidth: .infinity)

                    Input(
                        placeHolder: timePlaceholder,
                        text: $timeText
                    )
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)

                GreenCTAButton(
                    text: buttonText,
                    systemIcon: "plus",
                    color: Color.roomie.pine
                ) {
                    onAddTap?(dateText, timeText)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            AddEventItem()
        }
        .padding()
    }
}
