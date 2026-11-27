//
//  HomeScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pantalla principal (MainScreen / HomeScreen) que orquesta la barra de navegación inferior adaptativa y las pestañas según `UserType`.
/// Equivalente en SwiftUI al composable `MainScreen` de Jetpack Compose (`ui.screen.home`).
@MainActor
public struct HomeScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    @State private var startupViewmodel = StartupViewModel()




    public var body: some View {

        switch startupViewmodel.session{
         
        case .loading:
            VStack(spacing: 16) {
             
                ProgressView()
                
                
                ProgressView("Loading data...")
                    .tint(.blue)
                    .controlSize(.large)
            }
        case .authenticated(_,_, let userData):
            HomeTabs(userType: userData.role)
        case .guest:
            HomeTabs(userType: .new)
        default:
            VStack(spacing: 16) {
             
                ProgressView()
                
                
                ProgressView("Error")
                    .tint(.blue)
                    .controlSize(.large)
            }
       
        }
      
    }
}

