//
//  HomeHeader.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Encabezado de la pantalla de inicio / exploración con saludo, título y selector conmutador de vista (mapa / lista).
/// Equivalente en SwiftUI al composable `ExplorerHeader` de Jetpack Compose (`ui.components.home`).
public struct ExplorerHeader: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var activeView: ExplorerView
    public var onViewSelected: (ExplorerView) -> Void

    public init(
        activeView: ExplorerView = .map,
        onViewSelected: @escaping (ExplorerView) -> Void = { _ in }
    ) {
        self.activeView = activeView
        self.onViewSelected = onViewSelected
    }

    public init(activeView: Binding<ExplorerView>) {
        self.activeView = activeView.wrappedValue
        self.onViewSelected = { activeView.wrappedValue = $0 }
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Bienvenido")
                .font(.dmSans(.regular, size: 12))
                .lineSpacing(16 - 12)
                .foregroundStyle(Color.roomie.mute)

            Spacer().frame(height: 2)

            Text("Encuentra roomies\nde confianza")
                .font(.fraunces(.regular, size: 28))
                .lineSpacing(35 - 28)
                .foregroundStyle(Color.roomie.ink)

            Spacer().frame(height: 12)

            HStack(alignment: .center) {
                ViewToggleButtons(
                    activeView: activeView,
                    onViewSelected: onViewSelected
                )

                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
        .padding(.bottom, 4)
    }
}

/// Alias para corresponder al archivo `HomeHeader.kt` de Kotlin Compose.
public typealias HomeHeader = ExplorerHeader

// MARK: - Preview

#Preview {
    struct PreviewWrapper: View {
        @State private var view: ExplorerView = .map

        var body: some View {
            ZStack {
                RoomiePalette.ScreenBgBrush
                    .ignoresSafeArea()

                ExplorerHeader(activeView: view) { newView in
                    view = newView
                }
                .padding(.horizontal, 20)
            }
        }
    }

    return PreviewWrapper()
}
