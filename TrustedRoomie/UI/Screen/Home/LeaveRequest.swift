//
//  LeaveRequest.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Pantalla para que un inquilino solicite su salida del departamento.
/// Equivalente en SwiftUI al composable `LeaveRequest` de Jetpack Compose (`ui.screen.home`).
@MainActor
public struct LeaveRequest: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    @State private var selectedReasonIndex: Int = 0
    @State private var comments: String = ""

    public var initial: String
    public var name: String
    public var role: String
    public var reasons: [String]
    public var onBackTap: (() -> Void)?
    public var onSendRequestTap: (() -> Void)?

    public init(
        initial: String = "DF",
        name: String = "Diego Fernández",
        role: String = "Inquilino",
        reasons: [String] = [
            "Cambio de ciudad",
            "Cambio de trabajo",
            "Fin de contrato",
            "Presupuesto",
            "Otro motivo",
        ],
        onBackTap: (() -> Void)? = nil,
        onSendRequestTap: (() -> Void)? = nil
    ) {
        self.initial = initial
        self.name = name
        self.role = role
        self.reasons = reasons
        self.onBackTap = onBackTap
        self.onSendRequestTap = onSendRequestTap
    }

    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                // Tarjeta de información del inquilino
                BaseCard {
                    HStack(alignment: .center, spacing: 8) {
                        ZStack {
                            Circle()
                                .fill(Color.roomie.warn)
                                .frame(width: 30, height: 30)

                            Text(initial)
                                .font(.dmSans(.semiBold, size: 11.4))
                                .lineSpacing(17.1 - 11.4)
                                .foregroundStyle(Color.roomie.messageText)
                        }
                        .frame(width: 30, height: 30)

                        VStack(alignment: .leading, spacing: 0) {
                            Text(name)
                                .font(.dmSans(.semiBold, size: 14))
                                .lineSpacing(20 - 14)
                                .foregroundStyle(Color.roomie.ink)

                            Text(role)
                                .font(.dmSans(.regular, size: 12))
                                .lineSpacing(16 - 12)
                                .foregroundStyle(Color.roomie.mute)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Tarjeta de aviso aclaratorio
                VStack(alignment: .leading, spacing: 0) {
                    Text(
                        "roomies.invite.notice"
                    )
                    .font(.dmSans(.regular, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.ink.opacity(0.7))
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.roomie.sand)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                // Etiqueta Razón
                Text("roomies.leave_request.reason_label")
                    .font(.dmSans(.semiBold, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.mute)

                // Chips de selección de motivo (Flow / Wrapping)
                WrappingHStack(horizontalSpacing: 8, verticalSpacing: 8) {
                    ForEach(Array(reasons.enumerated()), id: \.offset) { index, reason in
                        ToggleChip(
                            text: reason,
                            selected: selectedReasonIndex == index,
                            onToggle: { isSelected in
                                if isSelected {
                                    selectedReasonIndex = index
                                }
                            }
                        )
                    }
                }

                // Campo de comentarios opcionales
                InputWithLabel(
                    label: "roomies.leave_request.comments_label",
                    lines: 3,
                    text: $comments
                )

                // Mensaje informativo inferior
                Text("roomies.leave_request.acceptance_notice")
                    .font(.dmSans(.regular, size: 12))
                    .lineSpacing(16 - 12)
                    .foregroundStyle(Color.roomie.mute)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            LeaveRequestBottomBar(onLeaveTap: onSendRequestTap)
        }
    }
}

/// Contenedor de flujo horizontal para envolver elementos (`FlowRow` en Compose).
private struct WrappingHStack<Content: View>: View {
    let horizontalSpacing: CGFloat
    let verticalSpacing: CGFloat
    let content: Content

    init(
        horizontalSpacing: CGFloat = 8,
        verticalSpacing: CGFloat = 8,
        @ViewBuilder content: () -> Content
    ) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content()
    }

    var body: some View {
        FlowLayout(spacing: horizontalSpacing, lineSpacing: verticalSpacing) {
            content
        }
    }
}

private struct FlowLayout: Layout {
    var spacing: CGFloat
    var lineSpacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var lineHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > maxWidth && currentX > 0 {
                currentX = 0
                currentY += lineHeight + lineSpacing
                lineHeight = 0
            }
            currentX += size.width + spacing
            lineHeight = max(lineHeight, size.height)
        }

        return CGSize(width: maxWidth, height: currentY + lineHeight)
    }

    func placeSubviews(
        in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()
    ) {
        var currentX = bounds.minX
        var currentY = bounds.minY
        var lineHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > bounds.maxX && currentX > bounds.minX {
                currentX = bounds.minX
                currentY += lineHeight + lineSpacing
                lineHeight = 0
            }
            subview.place(at: CGPoint(x: currentX, y: currentY), proposal: .unspecified)
            currentX += size.width + spacing
            lineHeight = max(lineHeight, size.height)
        }
    }
}

#Preview {
    LeaveRequest()
        .environment(NavigationRouter())
}
