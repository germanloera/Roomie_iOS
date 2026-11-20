//
//  HomeTabs.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

public struct HomeTabs: View {

    @State private var selection: Int = 0
   
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
                        case HomeTabsTenantLeaseholder.home.id: HomeTab(id: item.id).bg()
                        case HomeTabsTenantLeaseholder.payments.id: PaymentsScreen(id: item.id).bg()
                        case HomeTabsTenantLeaseholder.planner.id: PlannerScreen(id: item.id).bg()
                        case HomeTabsTenantLeaseholder.roomies.id: RoomiesTab(id: item.id).bg()
                        case HomeTabsTenantLeaseholder.profile.id: ProfileTab(id: item.id).bg()
                        default: EmptyView()

                        }
                    }
                }
            }.screenFrame().bg()
               .toolbarVisibility(.hidden, for: .navigationBar) 

        }
    }
}
