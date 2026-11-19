//
//  PlannerEventTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pestaña o listado del planificador para gestionar y visualizar eventos del hogar.
/// Equivalente en SwiftUI al composable `PannerEventTab` de Jetpack Compose (`ui.components.planner`).
public struct PlannerEventTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public init() {}

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 10) {
                AddEventItem()

                ForEach(0..<10, id: \.self) { _ in
                    EventItem()
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

public typealias PannerEventTab = PlannerEventTab

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PlannerEventTab()
            .padding(.horizontal)
    }
}
