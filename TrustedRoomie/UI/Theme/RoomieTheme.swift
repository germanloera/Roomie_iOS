import SwiftUI

// MARK: - Roomie Theme Modifiers & Styles

public struct RoomieCardModifier: ViewModifier {
    public var cornerRadius: CGFloat = RoomieRadius.medium
    public var padding: CGFloat = 16

    public func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(Color.roomie.card)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(Color.roomie.line, lineWidth: 1)
            )
    }
}

public struct RoomieGlassCardModifier: ViewModifier {
    public var cornerRadius: CGFloat = RoomieRadius.medium
    public var padding: CGFloat = 16

    public func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(Color.roomie.cardGlass)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(Color.roomie.line.opacity(0.6), lineWidth: 1)
            )
    }
}

public struct RoomiePrimaryButtonStyle: ButtonStyle {
    public var isDestructive: Bool = false

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .roomieFont(.labelLarge)
            .foregroundStyle(Color.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                isDestructive ? Color.roomie.error : Color.roomie.clay
            )
            .clipShape(RoundedRectangle(cornerRadius: RoomieRadius.small, style: .continuous))
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

public struct RoomiePineButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .roomieFont(.labelLarge)
            .foregroundStyle(Color.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.roomie.pine)
            .clipShape(RoundedRectangle(cornerRadius: RoomieRadius.small, style: .continuous))
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension View {
    func roomieCard(cornerRadius: CGFloat = RoomieRadius.medium, padding: CGFloat = 16) -> some View {
        modifier(RoomieCardModifier(cornerRadius: cornerRadius, padding: padding))
    }

    func roomieGlassCard(cornerRadius: CGFloat = RoomieRadius.medium, padding: CGFloat = 16) -> some View {
        modifier(RoomieGlassCardModifier(cornerRadius: cornerRadius, padding: padding))
    }

    func roomieBackground() -> some View {
        background(Color.roomie.paper.ignoresSafeArea())
    }
}
