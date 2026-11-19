//
//  PlannerNavHost.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

public extension PlannerDestination {
    static var EVENTS: PlannerDestination { .events }
    static var TASKS: PlannerDestination { .tasks }

    var route: String {
        switch self {
        case .events: return "events"
        case .tasks: return "tasks"
        }
    }
}

/// NavHost secundario para alternar entre Eventos y Tareas del planificador.
/// Equivalente en SwiftUI a `PlannerNavHost` de Jetpack Compose (`ui.navigation`).
public struct PlannerNavHost: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var destination: PlannerDestination

    public init(destination: Binding<PlannerDestination>) {
        self._destination = destination
    }

    public init(destination: PlannerDestination = .events) {
        self._destination = .constant(destination)
    }

    public var body: some View {
        Group {
            switch destination {
            case .events:
                PlannerEventTab()
            case .tasks:
                PlannerTasks()
            }
        }
    }
}
