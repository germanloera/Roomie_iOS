//
//  HomeTabs.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

public struct HomeTabs: View {

    @State private var selection: Int = 0
    @State private var config = ScreenConfig(title: "Hola German", subtitle: "Roma norte", )

    public init(userType: UserType) {
        currentUserType = userType
    }

    public var body: some View {

        switch currentUserType {
        case .unregistered:

            TabView(selection: $selection) {
                let items = HomeTabsUnregistered.asList()
                ForEach(items) { item in
                    Tab(item.text, systemImage: item.iconName, value: item.id) {
                        switch item.id {
                        case HomeTabsUnregistered.explore.id: ExploreTab().bg()
                        case HomeTabsUnregistered.profile.id: ProfileTab().bg()
                        default: EmptyView()

                        }
                    }
                }
            }

        case .registered:
            TabView(selection: $selection) {
                let items = HomeTabsRegistered.asList()
                ForEach(items) { item in
                    Tab(item.text, systemImage: item.iconName, value: item.id) {
                        switch item.id {
                        case HomeTabsRegistered.explore.id: ExploreTab().bg()
                        case HomeTabsRegistered.chats.id: ChatTab()
                        case HomeTabsRegistered.notifications.id: NotificationsTab().bg()
                        case HomeTabsRegistered.profile.id: ProfileTab().bg()
                        default: EmptyView()

                        }
                    }
                }
            }

        case .tenant, .leaseholder:

            TabView(selection: $selection) {
                let items = HomeTabsTenantLeaseholder.asList()
                ForEach(items) { item in
                    Tab(item.text, systemImage: item.iconName, value: item.id) {
                        switch item.id {
                        case HomeTabsTenantLeaseholder.home.id: HomeTab().bg()
                        case HomeTabsTenantLeaseholder.payments.id: PaymentsScreen().bg()
                        case HomeTabsTenantLeaseholder.planner.id: PlannerScreen().bg()
                        case HomeTabsTenantLeaseholder.roomies.id: RoomiesTab().bg()
                        case HomeTabsTenantLeaseholder.profile.id: ProfileTab().bg()
                        default: EmptyView()

                        }
                    }
                }
            }.screenFrame().bg()
                .title(config: config)
                .navigationBarTitleDisplayMode(.inline)
                .ignoresSafeArea(edges: .top)
                .onChange(
                    of: selection,
                    { _, newTab in
                        switch newTab {
                        case HomeTabsTenantLeaseholder.home.id:
                            config = ScreenConfig(title: "Hola German", subtitle: "Roma norte", )
                        case HomeTabsTenantLeaseholder.payments.id:
                            config = ScreenConfig(
                                title: "Pagos",
                                subtitle: "Un pago es válido cuando ambos lo confirman")
                        case HomeTabsTenantLeaseholder.planner.id:
                            config = ScreenConfig(title: "Agenda", )
                        case HomeTabsTenantLeaseholder.roomies.id:
                            config = ScreenConfig(title: "Roomies", )
                        case HomeTabsTenantLeaseholder.profile.id:
                            config = ScreenConfig(title: "Perfil", )
                        default: config = ScreenConfig()
                        }

                    })

        }
    }
}
