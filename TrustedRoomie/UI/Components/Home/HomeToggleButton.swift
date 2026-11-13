//
//  HomeToggleButton.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

// MARK: - Explorer View Enum

/// Representa el modo de visualización en la pestaña de exploración (Mapa o Lista).
public enum ExplorerView: String, CaseIterable, Identifiable {
    case map
    case list

    public var id: String { rawValue }

    // Compatibilidad con la nomenclatura en mayúsculas de Kotlin Compose
    public static let MAP: ExplorerView = .map
    public static let LIST: ExplorerView = .list
}

// MARK: - View Toggle Buttons

/// Selector conmutador de vistas (mapa / lista) con fondo tipo píldora.
/// Equivalente en SwiftUI al composable `ViewToggleButtons` de Jetpack Compose (`ui.components.home`).
public struct ViewToggleButtons: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var activeView: ExplorerView
    public var onViewSelected: (ExplorerView) -> Void

    public init(
        activeView: ExplorerView,
        onViewSelected: @escaping (ExplorerView) -> Void
    ) {
        self.activeView = activeView
        self.onViewSelected = onViewSelected
    }

    public init(activeView: Binding<ExplorerView>) {
        self.activeView = activeView.wrappedValue
        self.onViewSelected = { activeView.wrappedValue = $0 }
    }

    public var body: some View {
        HStack(spacing: 0) {
            // Map button
            let mapActive = activeView == .map
            HomeToggleButton(
                icon: "ic_map_pin",
                active: mapActive,
                contentDescription: "Vista mapa"
            ) {
                onViewSelected(.map)
            }

            // List button
            let listActive = activeView == .list
            HomeToggleButton(
                icon: "ic_list_lines",
                active: listActive,
                contentDescription: "Vista lista"
            ) {
                onViewSelected(.list)
            }
        }
        .padding(4)
        .background(Color.roomie.sand)
        .clipShape(Capsule(style: .continuous))
        .animation(.easeInOut(duration: 0.2), value: activeView)
    }
}

// MARK: - Home Toggle Button

/// Botón individual de alternancia de vista con icono y estado activo.
/// Equivalente en SwiftUI al composable `HomeToggleButton` de Jetpack Compose (`ui.components.home`).
public struct HomeToggleButton: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var icon: String
    public var active: Bool
    public var contentDescription: String
    public var onTap: () -> Void

    public init(
        icon: String = "ic_map_pin",
        active: Bool = false,
        contentDescription: String = "Vista mapa",
        onTap: @escaping () -> Void = {}
    ) {
        self.icon = icon
        self.active = active
        self.contentDescription = contentDescription
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(active ? Color.white : Color.roomie.ink.opacity(0.6))
                .frame(width: 36, height: 32)
                .background(active ? Color.roomie.pine : Color.clear)
                .clipShape(Capsule(style: .continuous))
                .contentShape(Capsule(style: .continuous))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(contentDescription)
    }
}

// MARK: - Preview

#Preview {
    struct PreviewContainer: View {
        @State private var currentView: ExplorerView = .map

        var body: some View {
            ZStack {
                RoomiePalette.ScreenBgBrush
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    Text("Vista actual: \(currentView.rawValue)")
                        .font(.headline)
                        .foregroundStyle(Color.roomie.ink)

                    ViewToggleButtons(activeView: currentView) { view in
                        currentView = view
                    }

                    HStack(spacing: 16) {
                        HomeToggleButton(icon: "ic_map_pin", active: true)
                        HomeToggleButton(icon: "ic_list_lines", active: false)
                    }
                }
                .padding()
            }
        }
    }

    return PreviewContainer()
}
