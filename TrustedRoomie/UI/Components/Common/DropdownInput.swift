//
//  DropdownInput.swift
//  TrustedRoomie
//
//  Created by Antigravity on 11/26/26.
//

import SwiftUI

/// Componente de selección desplegable (Dropdown) con comportamiento de solo lectura y estética consistente con `Input`.
public struct DropdownInput<T: Hashable & Sendable>: View {
    public var placeHolder: String
    public var options: [DropdownOption<T>]
    public var isRequired: Bool
    public var errorMessage: String?
    public var forceShowError: Bool
    public var onOptionSelected: ((DropdownOption<T>) -> Void)?

    @Binding private var selectedOptionBinding: DropdownOption<T>?
    @State private var internalSelectedOption: DropdownOption<T>?
    private let isExternalBinding: Bool

    @State private var isExpanded: Bool = false
    @State private var hasInteracted: Bool = false
    @State private var containerSize: CGSize = .zero

    // MARK: - Initializers

    /// Inicializador con binding a `DropdownOption<T>?`
    public init(
        placeHolder: String = "Selecciona una opción",
        options: [DropdownOption<T>],
        selectedOption: Binding<DropdownOption<T>?>,
        isRequired: Bool = false,
        errorMessage: String? = nil,
        forceShowError: Bool = false,
        onOptionSelected: ((DropdownOption<T>) -> Void)? = nil
    ) {
        self.placeHolder = placeHolder
        self.options = options
        self.isRequired = isRequired
        self.errorMessage = errorMessage
        self.forceShowError = forceShowError
        self._selectedOptionBinding = selectedOption
        self.isExternalBinding = true
        self.onOptionSelected = onOptionSelected
    }

    /// Inicializador con valor inicial estático y callback
    public init(
        placeHolder: String = "Selecciona una opción",
        options: [DropdownOption<T>],
        selectedOption: DropdownOption<T>? = nil,
        isRequired: Bool = false,
        errorMessage: String? = nil,
        forceShowError: Bool = false,
        onOptionSelected: ((DropdownOption<T>) -> Void)? = nil
    ) {
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

    /// Inicializador con binding directo al valor subyacente `T?`
    public init(
        placeHolder: String = "Selecciona una opción",
        options: [DropdownOption<T>],
        selectedValue: Binding<T?>,
        isRequired: Bool = false,
        errorMessage: String? = nil,
        forceShowError: Bool = false,
        onOptionSelected: ((DropdownOption<T>) -> Void)? = nil
    ) {
        let matchedOption = options.first { $0.value == selectedValue.wrappedValue }
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

    // MARK: - Computed Properties

    private var currentOption: DropdownOption<T>? {
        isExternalBinding ? selectedOptionBinding : internalSelectedOption
    }

    private var shouldShowError: Bool {
        guard isRequired && currentOption == nil else { return false }
        return forceShowError || hasInteracted
    }

    private var resolvedErrorMessage: String {
        errorMessage ?? "Debes seleccionar una opción"
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Contenedor Principal (Simula el Input)
            Button {
                hasInteracted = true
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded.toggle()
                }
            } label: {
                HStack(spacing: 8) {
                    Group {
                        if let selected = currentOption {
                            Text(selected.label)
                                .font(.dmSans(.regular, size: 15))
                                .foregroundStyle(Color.roomie.ink)
                        } else {
                            Text(placeHolder)
                                .font(.dmSans(.regular, size: 15))
                                .foregroundStyle(Color.roomie.mute)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)

                    Image(systemName: "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color.roomie.mute)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.easeInOut(duration: 0.2), value: isExpanded)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.roomie.inputBackground)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(shouldShowError ? Color.roomie.error : Color.roomie.inputBorder, lineWidth: shouldShowError ? 1.5 : 1)
                )
            }
            .buttonStyle(.plain)
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear { containerSize = geo.size }
                        .onChange(of: geo.size) { _, newSize in containerSize = newSize }
                }
            )

            // Mensaje de Error
            if shouldShowError {
                Text(resolvedErrorMessage)
                    .font(.dmSans(.regular, size: 12))
                    .foregroundStyle(Color.roomie.error)
                    .padding(.horizontal, 4)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.easeInOut(duration: 0.2), value: shouldShowError)
        .overlay(alignment: .topLeading) {
            if isExpanded {
                floatingMenu
                    .frame(width: containerSize.width > 0 ? containerSize.width : nil)
                    .offset(y: containerSize.height + 4)
                    .transition(.opacity.combined(with: .scale(scale: 0.98, anchor: .top)))
                    .zIndex(1000)
            }
        }
        .zIndex(isExpanded ? 100 : 1)
    }

    // MARK: - Floating Menu

    private var floatingMenu: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 0) {
                ForEach(options) { option in
                    Button {
                        select(option: option)
                    } label: {
                        HStack {
                            Text(option.label)
                                .font(.dmSans(.regular, size: 15))
                                .foregroundStyle(Color.roomie.ink)

                            Spacer()

                            if currentOption?.id == option.id {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(Color.roomie.pine)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)

                    if option.id != options.last?.id {
                        Divider()
                            .overlay(Color.roomie.line.opacity(0.4))
                            .padding(.horizontal, 12)
                    }
                }
            }
        }
        .frame(maxHeight: 220)
        .background(Color.roomie.card)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.roomie.inputBorder, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.12), radius: 10, x: 0, y: 5)
    }

    private func select(option: DropdownOption<T>) {
        if isExternalBinding {
            selectedOptionBinding = option
        } else {
            internalSelectedOption = option
        }
        onOptionSelected?(option)
        withAnimation(.easeInOut(duration: 0.2)) {
            isExpanded = false
        }
    }
}

// MARK: - Previews

#Preview {
    struct DropdownPreviewContainer: View {
        enum RoomType: String, CaseIterable, Sendable {
            case single = "Individual"
            case shared = "Compartida"
            case suite = "Suite Privada"
        }

        @State private var selectedType: DropdownOption<RoomType>?

        let options: [DropdownOption<RoomType>] = RoomType.allCases.map {
            DropdownOption(value: $0, label: $0.rawValue)
        }

        var body: some View {
            ZStack {
                RoomiePalette.ScreenBgBrush
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    DropdownInput(
                        placeHolder: "Selecciona tipo de habitación",
                        options: options,
                        selectedOption: $selectedType,
                        isRequired: true
                    )

                    if let selected = selectedType {
                        Text("Seleccionado: \(selected.label)")
                            .font(.dmSans(.medium, size: 14))
                            .foregroundStyle(Color.roomie.pine)
                    }
                }
                .padding()
            }
        }
    }

    return DropdownPreviewContainer()
}
