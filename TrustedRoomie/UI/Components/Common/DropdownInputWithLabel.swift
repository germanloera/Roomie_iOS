//
//  DropdownInputWithLabel.swift
//  TrustedRoomie
//
//  Created by Antigravity on 11/26/26.
//

import SwiftUI

/// Componente que combina una etiqueta superior y un campo `DropdownInput` reutilizable.
public struct DropdownInputWithLabel<T: Hashable & Sendable>: View {
    public var label: String
    public var placeHolder: String
    public var options: [DropdownOption<T>]
    public var isRequired: Bool
    public var errorMessage: String?
    public var forceShowError: Bool
    public var onOptionSelected: ((DropdownOption<T>) -> Void)?

    @Binding private var selectedOptionBinding: DropdownOption<T>?
    @State private var internalSelectedOption: DropdownOption<T>?
    private let isExternalBinding: Bool

    // MARK: - Initializers

    /// Inicializador con binding a `DropdownOption<T>?`
    public init(
        label: String = "",
        placeHolder: String = "Selecciona una opción",
        options: [DropdownOption<T>],
        selectedOption: Binding<DropdownOption<T>?>,
        isRequired: Bool = false,
        errorMessage: String? = nil,
        forceShowError: Bool = false,
        onOptionSelected: ((DropdownOption<T>) -> Void)? = nil
    ) {
        self.label = label
        self.placeHolder = placeHolder
        self.options = options
        self.isRequired = isRequired
        self.errorMessage = errorMessage
        self.forceShowError = forceShowError
        self._selectedOptionBinding = selectedOption
        self.isExternalBinding = true
        self.onOptionSelected = onOptionSelected
    }

    /// Inicializador con binding directo al valor subyacente `T?`
    public init(
        label: String = "",
        placeHolder: String = "Selecciona una opción",
        options: [DropdownOption<T>],
        selectedValue: Binding<T?>,
        isRequired: Bool = false,
        errorMessage: String? = nil,
        forceShowError: Bool = false,
        onOptionSelected: ((DropdownOption<T>) -> Void)? = nil
    ) {
        let matchedOption = options.first { $0.value == selectedValue.wrappedValue }
        self.label = label
        self.placeHolder = placeHolder
        self.options = options
        self.isRequired = isRequired
        self.errorMessage = errorMessage
        self.forceShowError = forceShowError
        self.isExternalBinding = true
        self.onOptionSelected = onOptionSelected

        self._selectedOptionBinding = Binding(
            get: {
                options.first { $0.value == selectedValue.wrappedValue }
            },
            set: { newOption in
                selectedValue.wrappedValue = newOption?.value
            }
        )
        self._internalSelectedOption = State(initialValue: matchedOption)
    }

    /// Inicializador estático con valor inicial opcional
    public init(
        label: String = "",
        placeHolder: String = "Selecciona una opción",
        options: [DropdownOption<T>],
        selectedOption: DropdownOption<T>? = nil,
        isRequired: Bool = false,
        errorMessage: String? = nil,
        forceShowError: Bool = false,
        onOptionSelected: ((DropdownOption<T>) -> Void)? = nil
    ) {
        self.label = label
        self.placeHolder = placeHolder
        self.options = options
        self.isRequired = isRequired
        self.errorMessage = errorMessage
        self.forceShowError = forceShowError
        self._selectedOptionBinding = .constant(nil)
        self.isExternalBinding = false
        self._internalSelectedOption = State(initialValue: selectedOption)
        self.onOptionSelected = onOptionSelected
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !label.isEmpty {
                Text(label)
                    .font(.dmSans(.semiBold, size: 12))
                    .lineSpacing(4)
                    .foregroundStyle(Color.roomie.mute)
            }

            if isExternalBinding {
                DropdownInput(
                    placeHolder: placeHolder,
                    options: options,
                    selectedOption: $selectedOptionBinding,
                    isRequired: isRequired,
                    errorMessage: errorMessage,
                    forceShowError: forceShowError,
                    onOptionSelected: onOptionSelected
                )
            } else {
                DropdownInput(
                    placeHolder: placeHolder,
                    options: options,
                    selectedOption: internalSelectedOption,
                    isRequired: isRequired,
                    errorMessage: errorMessage,
                    forceShowError: forceShowError,
                    onOptionSelected: { newOption in
                        internalSelectedOption = newOption
                        onOptionSelected?(newOption)
                    }
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Previews

#Preview {
    struct DropdownWithLabelPreview: View {
        enum Zone: String, CaseIterable, Sendable {
            case condesa = "Condesa, CDMX"
            case roma = "Roma Norte, CDMX"
            case polanco = "Polanco, CDMX"
            case delValle = "Del Valle, CDMX"
        }

        @State private var selectedZone: DropdownOption<Zone>?

        let zoneOptions = Zone.allCases.map {
            DropdownOption(value: $0, label: $0.rawValue)
        }

        var body: some View {
            ZStack {
                RoomiePalette.ScreenBgBrush
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    DropdownInputWithLabel(
                        label: "Zona preferida",
                        placeHolder: "Elige una colonia o zona",
                        options: zoneOptions,
                        selectedOption: $selectedZone,
                        isRequired: true
                    )

                    if let selected = selectedZone {
                        Text("Zona seleccionada: \(selected.label)")
                            .font(.dmSans(.regular, size: 14))
                            .foregroundStyle(Color.roomie.pine)
                    }
                }
                .padding()
            }
        }
    }

    return DropdownWithLabelPreview()
}
