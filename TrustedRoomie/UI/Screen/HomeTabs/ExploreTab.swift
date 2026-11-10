//
//  ExploreTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Estado de UI para la pantalla de exploración.
/// Equivalente en Swift a `ExploreUIState` de Jetpack Compose.
public struct ExploreUIState: Equatable, Sendable {
    public var activeView: ExplorerView

    public init(activeView: ExplorerView = .map) {
        self.activeView = activeView
    }
}

/// ViewModel para la pantalla de exploración usando el patrón Observation moderno de Swift.
/// Equivalente en Swift a `ExploreViewModel` de Jetpack Compose.
@Observable
public final class ExploreViewModel {
    public var uiState: ExploreUIState

    public init(uiState: ExploreUIState = ExploreUIState()) {
        self.uiState = uiState
    }

    public func setView(_ view: ExplorerView) {
        uiState.activeView = view
    }
}

/// Pestaña principal de exploración que conmuta entre mapa y lista de roomies.
/// Equivalente en SwiftUI al composable `ExploreTab` de Jetpack Compose.
@MainActor
struct ExploreTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    @State private var viewModel: ExploreViewModel

    public init(viewModel: ExploreViewModel? = nil) {
        self._viewModel = State(wrappedValue: viewModel ?? ExploreViewModel())
    }

    var body: some View {
        ExploreTabContent(
            viewModel: viewModel,
            uiState: viewModel.uiState
        )
    }
}

/// Contenido visual de la pestaña de exploración.
/// Equivalente en SwiftUI al composable `ExploreTabContent` de Jetpack Compose.
public struct ExploreTabContent: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var viewModel: ExploreViewModel?
    public var uiState: ExploreUIState
    public var onViewSelected: ((ExplorerView) -> Void)?

    public init(
        viewModel: ExploreViewModel? = nil,
        uiState: ExploreUIState = ExploreUIState(),
        onViewSelected: ((ExplorerView) -> Void)? = nil
    ) {
        self.viewModel = viewModel
        self.uiState = uiState
        self.onViewSelected = onViewSelected
    }

    public var body: some View {
        VStack(spacing: 0) {
            ExplorerHeader(
                activeView: uiState.activeView,
                onViewSelected: { view in
                    if let viewModel {
                        viewModel.setView(view)
                    } else {
                        onViewSelected?(view)
                    }
                }
            )

            switch uiState.activeView {
            case .map:
                Map()
            case .list:
                // ExploreList(navigate = navigate)
                ExploreList()
            }
        }
        .padding(.horizontal, 20)
   
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ExploreTab()
        .environment(NavigationRouter())
}
