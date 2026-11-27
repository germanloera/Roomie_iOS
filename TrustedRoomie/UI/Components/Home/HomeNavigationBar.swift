//
//  HomeNavigationBar.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Barra de navegación inferior dinámica adaptada al tipo de usuario (`UserType`).
/// Equivalente en SwiftUI al composable `HomeNavigationBar` de Jetpack Compose (`ui.components.home`).
public struct HomeNavigationBar: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    private var currentUserType: UserRole = .new

    @Binding public var current: Int
    public var onTap: ((Int) -> Void)?

    private let isExternalBinding: Bool
    @State private var internalCurrent: Int = 0

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        current: Binding<Int>,
        userType: UserRole = .new,
        onTap: ((Int) -> Void)? = nil
    ) {
        self._current = current
    
        self.onTap = onTap
        self.isExternalBinding = true
    }

    /// Inicializador con valor estático y callback (paridad con Kotlin Compose).
    public init(
        current: Int = 0,
        userType: UserRole = .new,
        onTap: ((Int) -> Void)? = nil
    ) {
        self._current = .constant(current)
        currentUserType = userType
        self.onTap = onTap
        self.isExternalBinding = false
        self._internalCurrent = State(initialValue: current)
    }

    private var selectedIndex: Int {
        if isExternalBinding {
            return current
        } else {
            return internalCurrent
        }
    }

    private func handleSelection(_ index: Int) {
        if isExternalBinding {
            current = index
        } else {
            internalCurrent = index
        }
        onTap?(index)
    }

    private var tabItems: [HomeTabItem] {
        switch currentUserType {
        case .new:
            return HomeTabsUnregistered.asList()
        case .registered:
            return HomeTabsRegistered.asList()
        case .tenant, .leaseholder:
            return HomeTabsTenantLeaseholder.asList()
        }
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(tabItems) { tab in
                let isSelected = selectedIndex == tab.id

                Button {
                    handleSelection(tab.id)
                } label: {
                    VStack(spacing: 4) {
                        Image(tab.iconName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(isSelected ? Color.roomie.pine : Color.roomie.ink.opacity(0.6))

                        Text(tab.text)
                            .font(.dmSans(isSelected ? .semiBold : .regular, size: 11))
                            .lineSpacing(14 - 11)
                            .foregroundStyle(isSelected ? Color.roomie.pine : Color.roomie.ink.opacity(0.7))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 8)
        .padding(.bottom, 8)
        .padding(.top, 4)
        .background(Color.roomie.cardGlass)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color.roomie.line)
                .frame(height: 0.5)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 30) {
            HomeNavigationBar(current: 0, userType: .new)
            HomeNavigationBar(current: 1, userType: .registered)
            HomeNavigationBar(current: 0, userType: .tenant)
        }
    }
}
