//
//  ExploreTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation



/// Pestaña principal de exploración que conmuta entre mapa y lista de roomies.
/// Equivalente en SwiftUI al composable `ExploreTab` de Jetpack Compose (`ui.screen.home.tabs`).



/// Contenido visual de la pestaña de exploración.
/// Equivalente en SwiftUI al composable `ExploreTabContent` de Jetpack Compose.
@MainActor
struct ExploreTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    @State private var viewModel = ExploreTabViewModel()
    public init() {}

    public var body: some View {
        VStack(spacing: 0) {
     
                switch viewModel.activeView {
                case .map:
                    MapView(
                        onListTap: {
                            viewModel.setTab(.list)
                        },
                        onCardTap: {
                            router?.navigate(to: HomeRoute.ListingDetails())
                        
                        }
                        
                        
                    )
                case .list:
                    ExploreList(
                        onMapTap: {
                            viewModel.setTab(.map)
                        },
                        onCardTap: {_ in
                            router?.navigate(to: HomeRoute.ListingDetails())
                        }
                    )
            
                    
                }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

// Typealiases para compatibilidad nominal con el archivo Kotlin (`Explore.kt`).

