//
//  HomeTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

@MainActor
public struct HomeTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

   public var id: Int = -1

    public init(id: Int = -1) {
        self.id = id
    }

    public var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            HomeTabHeader(id: id)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    HomeGreenHeaderCard()

                    RoomieSectionHeader(text: "home.section.interested")

                    ForEach(0..<2, id: \.self) { _ in
                        RoomieListItem()
                    }

                    RoomieSectionHeader(text: "home.section.incidents", rightText: "common.view_all") {
                        //router?.navigate(to: Hashable)
                    }

                    ForEach(0..<2, id: \.self) { _ in
                        PaymentIncidentItem(showDescription: false)
                    }

                    RoomieSectionHeader(text: "home.section.pending_payments", rightText: "common.view_all") {
                        // Navegación o filtro a pagos
                    }

                    ForEach(0..<2, id: \.self) { _ in
                        PaymentPaymentsItem(showUserDetail: false)
                    }

                    RoomieSectionHeader(text: "home.section.floor_tasks", rightText: "common.view_all") {
                        // Navegación o filtro a tareas
                    }

                    ForEach(0..<2, id: \.self) { _ in
                        TaskItem(readOnly: true)
                    }

                    RoomieSectionHeader(text: "home.section.upcoming_events")

                    ForEach(0..<2, id: \.self) { _ in
                        EventItem(readOnly: true)
                    }
                }
                .padding(.bottom, 20)

            }
            .scrollIndicators(.hidden)

        }

    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

    }
}
