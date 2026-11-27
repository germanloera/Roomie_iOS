//
//  PlannerScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Destinos o subpestañas de navegación en la pantalla de Agenda / Planificador.
public enum PlannerDestination: Int, CaseIterable, Identifiable, Sendable {
    case tasks = 0
    case events = 1

    public var id: Int { rawValue }

    public var label: String {
        switch self {
        case .tasks: return L10n.string("planner.tab.tasks", defaultValue: "Tareas")
        case .events: return L10n.string("planner.tab.events", defaultValue: "Eventos")
        }
    }
}

/// Pantalla principal de Agenda con selector superior de pestañas tipo píldora (Tareas / Eventos) y vistas correspondientes.
/// Equivalente en SwiftUI al composable `PlannerScreen` de Jetpack Compose (`ui.screen.home.tabs`).
@MainActor
public struct PlannerScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var id: Int = -1

    public init(id: Int = -1) {
        self.id = id
    }


    @State private var selectedDestination: PlannerDestination = .tasks

  /*  public init(initialDestination: PlannerDestination = .tasks) {
        self._selectedDestination = State(initialValue: initialDestination)
    }*/

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HomeTabHeader(id: id)
            HStack(spacing: 0) {
                ForEach(PlannerDestination.allCases) { destination in
                    let isSelected = selectedDestination == destination

                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedDestination = destination
                        }
                    } label: {
                        Text(destination.label)
                            .font(.dmSans(.semiBold, size: 14))
                            .lineLimit(1)
                            .foregroundStyle(isSelected ? Color.white : Color.roomie.pine)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(
                                isSelected
                                    ? RoundedRectangle(cornerRadius: 100, style: .continuous)
                                        .fill(Color.roomie.pine)
                                    : nil
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(4)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 100, style: .continuous)
                    .fill(Color.roomie.sand)
            )
            .padding(.vertical, 10)

            // Contenedor de contenido según destino seleccionado
            Group {
                switch selectedDestination {
                case .tasks:
                    PlannerTasks()
                case .events:
                    PlannerEventTab()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }

    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PlannerScreen()
            .environment(NavigationRouter())
    }
}
