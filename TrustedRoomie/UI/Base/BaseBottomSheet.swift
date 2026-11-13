//
//  BaseBottomSheet.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// BottomSheet maestro reutilizable para la aplicación Roomie.
/// Equivalente en SwiftUI al composable `BaseBottomSheet` de Jetpack Compose (`ui.base`).
public struct BaseBottomSheet<Content: View>: View {
    // @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @Binding public var isPresented: Bool
    public var onDismissRequest: (() -> Void)?
    public var containerColor: Color
    public var scrimColor: Color
    public var cornerRadius: CGFloat
    public var showDragHandle: Bool
    public var enableBlur: Bool
    public var content: Content

    @State private var dragOffset: CGFloat = 0

    public init(
        isPresented: Binding<Bool>,
        containerColor: Color = Color.roomie.card,
        scrimColor: Color = ScrimColor,
        cornerRadius: CGFloat = 24,
        showDragHandle: Bool = true,
        enableBlur: Bool = false,
        onDismissRequest: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = isPresented
        self.containerColor = containerColor
        self.scrimColor = scrimColor
        self.cornerRadius = cornerRadius
        self.showDragHandle = showDragHandle
        self.enableBlur = enableBlur
        self.onDismissRequest = onDismissRequest
        self.content = content()
    }

    public init(
        isVisible: Bool = true,
        containerColor: Color = Color.roomie.card,
        scrimColor: Color = ScrimColor,
        cornerRadius: CGFloat = 24,
        showDragHandle: Bool = true,
        enableBlur: Bool = false,
        onDismissRequest: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = .constant(isVisible)
        self.containerColor = containerColor
        self.scrimColor = scrimColor
        self.cornerRadius = cornerRadius
        self.showDragHandle = showDragHandle
        self.enableBlur = enableBlur
        self.onDismissRequest = onDismissRequest
        self.content = content()
    }

    public var body: some View {
        if isPresented {
            ZStack(alignment: .bottom) {
                // Scrim overlay
                scrimColor
                    .ignoresSafeArea()
                    .onTapGesture {
                        dismiss()
                    }
                    .transition(.opacity)

                // BottomSheet container
                VStack(spacing: 0) {
                    if showDragHandle {
                        Capsule()
                            .fill(Color.roomie.mute.opacity(0.4))
                            .frame(width: 36, height: 4)
                            .padding(.top, 10)
                            .padding(.bottom, 12)
                    }

                    content
                }
                .frame(maxWidth: .infinity)
                .background(
                    Group {
                        if enableBlur {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                        } else {
                            containerColor
                        }
                    }
                )
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: cornerRadius,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: cornerRadius,
                        style: .continuous
                    )
                )
                .offset(y: max(0, dragOffset))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.height > 0 {
                                dragOffset = value.translation.height
                            }
                        }
                        .onEnded { value in
                            if value.translation.height > 100 || value.predictedEndTranslation.height > 200 {
                                dismiss()
                            } else {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    dragOffset = 0
                                }
                            }
                        }
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
            .animation(.spring(response: 0.35, dampingFraction: 0.85), value: isPresented)
            .ignoresSafeArea(edges: .bottom)
        }
    }

    private func dismiss() {
        withAnimation(.easeOut(duration: 0.25)) {
            isPresented = false
            dragOffset = 0
        }
        onDismissRequest?()
    }
}

// MARK: - View Extension for BaseBottomSheet Presentation Modifier

public extension View {
    /// Presenta un `BaseBottomSheet` modal como modifier sobre cualquier vista.
    func baseBottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        containerColor: Color = Color.roomie.card,
        scrimColor: Color = ScrimColor,
        cornerRadius: CGFloat = 24,
        showDragHandle: Bool = true,
        enableBlur: Bool = false,
        onDismissRequest: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        overlay {
            BaseBottomSheet(
                isPresented: isPresented,
                containerColor: containerColor,
                scrimColor: scrimColor,
                cornerRadius: cornerRadius,
                showDragHandle: showDragHandle,
                enableBlur: enableBlur,
                onDismissRequest: onDismissRequest,
                content: content
            )
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        BaseBottomSheet(
            isVisible: true,
            onDismissRequest: {}
        ) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Título del BottomSheet")
                    .font(.dmSans(.semiBold, size: 20))
                    .foregroundStyle(Color.roomie.ink)

                Spacer().frame(height: 8)

                Text("Este es un ejemplo del contenido renderizado dentro del BaseBottomSheet maestro.")
                    .font(.dmSans(.regular, size: 14))
                    .foregroundStyle(Color.roomie.mute)

                Spacer().frame(height: 24)

                DefaultButton(text: "Aceptar")

                Spacer().frame(height: 16)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
        }
    }
}
