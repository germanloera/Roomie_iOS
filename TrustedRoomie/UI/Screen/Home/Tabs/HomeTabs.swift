//
//  HomeTabs.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

public struct HomeTabs: View {
    
    @State private var selection: Int = 0
    public var userType: UserType = .unregistered
    
    public var body: some View {
        
        
        switch userType {
        case .unregistered:
            
            TabView(selection: $selection) {
                let items = HomeTabsUnregistered.asList()
                ForEach(items) { item in
                    Tab(item.text, systemImage: item.iconName, value: item.id){
                        switch item.id {
                        case HomeTabsUnregistered.explore.id : ExploreTab().bg()
                        case HomeTabsUnregistered.profile.id : ProfileTab().bg()
                        default: EmptyView()
                            
                        }
                    }
                }
            }
            
        case .registered:
            TabView(selection: $selection) {
                let items = HomeTabsRegistered.asList()
                ForEach(items) { item in
                    Tab(item.text, systemImage: item.iconName, value: item.id){
                        switch item.id {
                        case HomeTabsRegistered.explore.id : ExploreTab().bg()
                        case HomeTabsRegistered.chats.id : ChatTab()
                        case HomeTabsRegistered.notifications.id :  NotificationsTab().bg()
                        case HomeTabsRegistered.profile.id : ProfileTab().bg()
                        default: EmptyView()
                            
                        }
                    }
                }
            }
        case .tenant, .leaseholder:
            
            TabView(selection: $selection) {
                let items = HomeTabsTenantLeaseholder.asList()
                ForEach(items) { item in
                    Tab(item.text, systemImage: item.iconName, value: item.id){
                        switch item.id {
                        case HomeTabsTenantLeaseholder.home.id : ExploreTab().bg()
                        case HomeTabsTenantLeaseholder.payments.id : PaymentsScreen()
                        case HomeTabsTenantLeaseholder.planner.id :  PlannerScreen().bg()
                        case HomeTabsTenantLeaseholder.roomies.id : RoomiesTab().bg()
                        case HomeTabsTenantLeaseholder.profile.id : ProfileTab().bg()
                        default: EmptyView()
                            
                        }
                    }
                }
            }
            
            
        }
    }
}
    
    

