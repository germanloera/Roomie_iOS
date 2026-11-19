//
//  HomeScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// ViewModel para la gestión del índice de pestañas inferiores de la pantalla principal.
/// Equivalente en SwiftUI a `HomeViewModel` de Jetpack Compose (`ui.vm`).
@Observable
public final class HomeViewModel {
    public var bottomBarIndex: Int

    public init(bottomBarIndex: Int = 0) {
        self.bottomBarIndex = bottomBarIndex
    }

    public func setBottomBarIndex(_ index: Int) {
        self.bottomBarIndex = index
    }
}

/// Pantalla principal (MainScreen / HomeScreen) que orquesta la barra de navegación inferior adaptativa y las pestañas según `UserType`.
/// Equivalente en SwiftUI al composable `MainScreen` de Jetpack Compose (`ui.screen.home`).
@MainActor
public struct HomeScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
  
    
    @State private var viewModel: HomeViewModel
 

    public init(
        viewModel: HomeViewModel? = nil,
       
    ) {
        self._viewModel = State(wrappedValue: viewModel ?? HomeViewModel())

    }

    public var body: some View {
        
        HomeScaffold(
            bottomBar: {},
            content: {
                HomeTabs(userType: .registered)
            }
        )
        
    }
}

