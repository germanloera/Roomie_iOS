//
//  TaskItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Elemento de tarjeta que representa una tarea del planificador con casilla circular y botón para eliminar opcional.
/// Equivalente en SwiftUI al composable `TaskItem` de Jetpack Compose (`ui.components.planner.items`).
public struct TaskItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var time: String
    public var readOnly: Bool
    public var onTap: (() -> Void)?
    public var onChange: ((Bool) -> Void)?

    @State private var checked: Bool

    public init(
        title: String = "Cena de roomies",
        time: String = "8:00 pm",
        isChecked: Bool = true,
        readOnly: Bool = false,
        onTap: (() -> Void)? = nil,
        onChange: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.time = time
        self.readOnly = readOnly
        self._checked = State(initialValue: isChecked)
        self.onTap = onTap
        self.onChange = onChange
    }

    public var body: some View {
        BaseCard(padding: 16) {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center, spacing: 12) {
                    RoundCheckBox(
                        checked: checked,
                        enabled: !readOnly,
                        onCheckedChange: { newChecked in
                            if !readOnly {
                                checked = newChecked
                                onChange?(newChecked)
                            }
                        }
                    )

                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(.dmSans(.semiBold, size: 14))
                            .lineSpacing(20 - 14)
                            .foregroundStyle(Color.roomie.ink)

                        Text(time)
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    if !readOnly {
                        Button {
                            onTap?()
                        } label: {
                            Image(systemName: "trash")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundStyle(Color.roomie.pine)
                                .frame(width: 17, height: 17)
                                .padding(1)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Eliminar tarea")
                    }
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

        VStack(spacing: 12) {
            TaskItem()
            TaskItem(readOnly: true)
        }
        .padding()
    }
}
