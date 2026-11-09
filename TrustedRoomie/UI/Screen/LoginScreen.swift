
//
//  NavigationScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

struct LoginScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) { }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center).title("Iniciar session")
    }
}
