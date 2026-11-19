//
//  RoundCheckBox.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Casilla de verificación circular con animación suave de escala y color.
/// Equivalente en SwiftUI al composable `RoundCheckBox` de Jetpack Compose (`ui.components.common`).
public struct RoundCheckBox: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var checked: Bool
    public var enabled: Bool
    public var size: CGFloat
    public var checkedColor: Color
    public var uncheckedBorderColor: Color
    public var checkmarkColor: Color
    public var onCheckedChange: ((Bool) -> Void)?

    private let isExternalBinding: Bool
    @State private var internalChecked: Bool = false

    /// Inicializador con Binding directo (patrón estándar de SwiftUI).
    public init(
        checked: Binding<Bool>,
        enabled: Bool = true,
        size: CGFloat = 24,
        checkedColor: Color = Color.roomie.pine,
        uncheckedBorderColor: Color = Color.roomie.inputBorder,
        checkmarkColor: Color = .white,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self._checked = checked
        self.enabled = enabled
        self.size = size
        self.checkedColor = checkedColor
        self.uncheckedBorderColor = uncheckedBorderColor
        self.checkmarkColor = checkmarkColor
        self.onCheckedChange = onCheckedChange
        self.isExternalBinding = true
    }

    /// Inicializador por valor estático y callback (paridad con Compose).
    public init(
        checked: Bool = false,
        enabled: Bool = true,
        size: CGFloat = 24,
        checkedColor: Color = Color.roomie.pine,
        uncheckedBorderColor: Color = Color.roomie.inputBorder,
        checkmarkColor: Color = .white,
        onCheckedChange: ((Bool) -> Void)? = nil
    ) {
        self._checked = .constant(checked)
        self.enabled = enabled
        self.size = size
        self.checkedColor = checkedColor
        self.uncheckedBorderColor = uncheckedBorderColor
        self.checkmarkColor = checkmarkColor
        self.onCheckedChange = onCheckedChange
        self.isExternalBinding = false
        self._internalChecked = State(initialValue: checked)
    }

    private var currentBinding: Binding<Bool> {
        if isExternalBinding {
            return $checked
        } else {
            return $internalChecked
        }
    }

    private var isChecked: Bool {
        currentBinding.wrappedValue
    }

    private var currentBgColor: Color {
        if !enabled && isChecked {
            return checkedColor.opacity(0.38)
        } else if !enabled {
            return Color.clear
        } else if isChecked {
            return checkedColor
        } else {
            return Color.clear
        }
    }

    private var currentBorderColor: Color {
        if !enabled {
            return uncheckedBorderColor.opacity(0.38)
        } else if isChecked {
            return checkedColor
        } else {
            return uncheckedBorderColor
        }
    }

    public var body: some View {
        Button {
            guard enabled else { return }
            withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                currentBinding.wrappedValue.toggle()
                onCheckedChange?(currentBinding.wrappedValue)
            }
        } label: {
            ZStack {
                Circle()
                    .fill(currentBgColor)
                    .frame(width: size, height: size)

                Circle()
                    .strokeBorder(currentBorderColor, lineWidth: 2)
                    .frame(width: size, height: size)

                if isChecked {
                    Image(systemName: "checkmark")
                        .font(.system(size: size * 0.45, weight: .bold))
                        .foregroundStyle(enabled ? checkmarkColor : checkmarkColor.opacity(0.7))
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .disabled(!enabled)
        .animation(.easeInOut(duration: 0.15), value: isChecked)
        .animation(.easeInOut(duration: 0.15), value: enabled)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            RoundCheckBox(checked: true)
            RoundCheckBox(checked: false)
            RoundCheckBox(checked: true, enabled: false)
        }
        .padding()
    }
}
