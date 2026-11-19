//
//  ToggleChip.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Etiqueta interactiva tipo pastilla conmutable (ToggleChip) con estado seleccionado/no seleccionado.
/// Equivalente en SwiftUI al composable `ToggleChip` de Jetpack Compose (`ui.components.common`).
public struct ToggleChip: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isSelected: Bool
    public var text: String
    public var onToggle: ((Bool) -> Void)?

    private let isExternalBinding: Bool
    @State private var internalSelected: Bool = false

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        isSelected: Binding<Bool>,
        text: String = "",
        onToggle: ((Bool) -> Void)? = nil
    ) {
        self._isSelected = isSelected
        self.text = text
        self.onToggle = onToggle
        self.isExternalBinding = true
    }

    /// Inicializador con valor estático y callback opcional (paridad con Compose).
    public init(
        selected: Bool = false,
        text: String = "",
        onToggle: ((Bool) -> Void)? = nil
    ) {
        self._isSelected = .constant(selected)
        self.text = text
        self.onToggle = onToggle
        self.isExternalBinding = false
        self._internalSelected = State(initialValue: selected)
    }

    /// Inicializador con texto primero (paridad directa con llamada en Compose `ToggleChip(text = "...")`).
    public init(
        text: String,
        selected: Bool = false,
        onToggle: ((Bool) -> Void)? = nil
    ) {
        self._isSelected = .constant(selected)
        self.text = text
        self.onToggle = onToggle
        self.isExternalBinding = false
        self._internalSelected = State(initialValue: selected)
    }

    private var currentBinding: Binding<Bool> {
        if isExternalBinding {
            return $isSelected
        } else {
            return $internalSelected
        }
    }

    private var selectedValue: Bool {
        currentBinding.wrappedValue
    }

    private var backgroundColor: Color {
        selectedValue ? Color.roomie.pine : Color.roomie.buttonGlass
    }

    private var textColor: Color {
        selectedValue ? Color.roomie.homeGreenCardSubtitle : Color.roomie.ink
    }

    public var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.15)) {
                currentBinding.wrappedValue.toggle()
                onToggle?(currentBinding.wrappedValue)
            }
        } label: {
            Text(text)
                .font(.dmSans(.regular, size: 12))
                .lineSpacing(16 - 12)
                .foregroundStyle(textColor)
                .padding(.horizontal, 12)
                .frame(height: 32)
                .background(
                    RoundedRectangle(cornerRadius: 100, style: .continuous)
                        .fill(backgroundColor)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            ToggleChip(selected: true, text: "Habitación individual")
            ToggleChip(selected: false, text: "Baño propio")
            ToggleChip(text: "Servicios incluidos", selected: false)
        }
        .padding()
    }
}
