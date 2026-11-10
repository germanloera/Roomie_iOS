//
//  ExplorerHeader.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Encabezado de la pantalla de exploración con saludo, título y selector conmutador de vista (mapa / lista).
/// Equivalente en SwiftUI al composable `ExplorerHeader` de Jetpack Compose.
public struct ExplorerHeader: View {
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
                .font(.system(size: 12, weight: .regular))
                .dmSansFont(.regular, size: 12)
                .lineSpacing(4) // 16sp lineHeight - 12sp fontSize
                .foregroundStyle(ColorMute)

            Spacer().frame(height: 2)

            Text("Encuentra roomies\nde confianza")
                .font(.system(size: 28, weight: .regular, design: .serif))
                .frauncesFont(.regular, size: 28)
                .lineSpacing(7) // 35sp lineHeight - 28sp fontSize
                .foregroundStyle(ColorInk)

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
