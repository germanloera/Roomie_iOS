//
//  PaymentsScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Destinos o subpestañas de navegación en la pantalla de Pagos.
public enum PaymentsDestination: Int, CaseIterable, Identifiable, Sendable {
    case services = 0
    case incidents = 1

    public var id: Int { rawValue }

    public var label: String {
        switch self {
        case .services: return L10n.string("payments.tab.services", defaultValue: "Servicios")
        case .incidents: return L10n.string("payments.tab.incidents", defaultValue: "Incidentes")
        }
    }
}

/// Pantalla principal de Pagos con selector tipo píldora (Servicios / Incidentes) y listados scrolleables.
/// Equivalente en SwiftUI al composable `PaymentsScreen` de Jetpack Compose (`ui.screen.home.tabs`).
@MainActor
public struct PaymentsScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var selectedDestination: PaymentsDestination = .services

    public var id: Int = -1

    public init(id: Int = -1) {
        self.id = id
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HomeTabHeader(id: id)
        
            HStack(spacing: 0) {
                ForEach(PaymentsDestination.allCases) { destination in
                    let isSelected = selectedDestination == destination

                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedDestination = destination
                        }
                    } label: {

                        Text(destination.label)
                            .font(.dmSans(.semiBold, size: 14))
                            .lineLimit(1)
                            .foregroundStyle(isSelected ? Color.white : Color.roomie.pine)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(
                                isSelected
                                    ? RoundedRectangle(cornerRadius: 100, style: .continuous)
                                        .fill(Color.roomie.pine)
                                    : nil
                            )
                            .contentShape(Rectangle())

                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(4)
            .background(
                Capsule(style: .continuous)
                    .fill(Color.roomie.sand)
            )
            .zIndex(1)

            Group {
                switch selectedDestination {
                case .services:
                    PaymentsServicesTab()
                case .incidents:
                    PaymentsIncidents()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)



        }.scrollIndicators(.hidden)
           
    



    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        PaymentsScreen()
            .environment(NavigationRouter())
    }
}
