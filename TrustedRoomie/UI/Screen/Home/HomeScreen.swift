
//
//  NavigationScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

enum NewUserTabs: Hashable {
    case home, profile
}

struct HomeScreen: View {
    @State private var selection: NewUserTabs = .home
    @Environment(NavigationRouter.self) private var router: NavigationRouter? 
    
    var body: some View {
        
        HomeScaffold(
            bottomBar: {},
            content: {
                
                TabView(selection: $selection) {
                    Tab("Home", systemImage: "house", value: NewUserTabs.home) {
                        ExploreTab().bg()
                    }
                    Tab("Perfil", systemImage: "person", value: NewUserTabs.profile) {
                        ProfileTab().bg() //.background(RoomiePalette.ScreenBgBrush.ignoresSafeArea())
                    }
                }
                
                
            })
        
        
        
    }
}
