//
//  NavigationScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

struct NavigationScreen: View {
    @State private var router = NavigationRouter()
    
    var body: some View {
        
        NavigationStack(path: $router.path ){
            HomeScreen()
                .LoginGraph()
                .ListingGraph()
        }
        
        
        
        
        
    }
}
