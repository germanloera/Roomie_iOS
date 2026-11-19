//
//  PlannerTasks.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pestaña o listado del planificador para gestionar y visualizar las tareas del hogar.
/// Equivalente en SwiftUI al composable `PlannerTasks` de Jetpack Compose (`ui.components.planner`).
public struct PlannerTasks: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public init() {}

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 10) {
                AddTaskItem()

                ForEach(0..<10, id: \.self) { _ in
                    TaskItem()
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PlannerTasks()
            .padding(.horizontal)
    }
}
