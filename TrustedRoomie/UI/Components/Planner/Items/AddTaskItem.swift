//
//  AddTaskItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Tarjeta para agregar una nueva tarea con campo de fecha y botón CTA verde.
/// Equivalente en SwiftUI al composable `AddTasksItem` de Jetpack Compose (`ui.components.planner.items`).
public struct AddTaskItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var datePlaceholder: String
    public var buttonText: String
    public var onAddTap: ((String) -> Void)?

    @State private var dateText: String = ""

    public init(
        title: String = "Nueva tarea",
        datePlaceholder: String = "Fecha",
        buttonText: String = "Agregar",
        onAddTap: ((String) -> Void)? = nil
    ) {
        self.title = title
        self.datePlaceholder = datePlaceholder
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

                    GreenCTAButton(
                        text: buttonText,
                        systemIcon: "plus",
                        color: Color.roomie.pine
                    ) {
                        onAddTap?(dateText)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

public typealias AddTasksItem = AddTaskItem

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            AddTaskItem()
        }
        .padding()
    }
}
