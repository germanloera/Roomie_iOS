import SwiftUI

// MARK: - Roomie Typography

public enum RoomieTextStyle {
    case displayLarge
    case displayMedium
    case headlineLarge
    case headlineMedium
    case titleLarge
    case titleMedium
    case bodyLarge
    case bodyMedium
    case labelLarge
    case labelSmall

    public var font: Font {
        switch self {
        case .displayLarge:
            return .system(size: 34, weight: .semibold, design: .serif)
        case .displayMedium:
            return .system(size: 28, weight: .medium, design: .serif)
        case .headlineLarge:
            return .system(size: 24, weight: .semibold, design: .serif)
        case .headlineMedium:
            return .system(size: 20, weight: .semibold, design: .default)
        case .titleLarge:
            return .system(size: 17, weight: .bold, design: .default)
        case .titleMedium:
            return .system(size: 15, weight: .semibold, design: .default)
        case .bodyLarge:
            return .system(size: 15, weight: .regular, design: .default)
        case .bodyMedium:
            return .system(size: 13, weight: .regular, design: .default)
        case .labelLarge:
            return .system(size: 13, weight: .semibold, design: .default)
        case .labelSmall:
            return .system(size: 11, weight: .medium, design: .default)
        }
    }

    public var tracking: CGFloat {
        switch self {
        case .displayLarge:
            return -0.5
        case .displayMedium:
            return -0.3
        default:
            return 0
        }
    }

    public var lineSpacing: CGFloat {
        switch self {
        case .displayLarge:
            return 6 // 40 line height - 34 font size
        case .displayMedium:
            return 6 // 34 - 28
        case .headlineLarge:
            return 6 // 30 - 24
        case .headlineMedium:
            return 6 // 26 - 20
        case .titleLarge:
            return 5 // 22 - 17
        case .titleMedium:
            return 5 // 20 - 15
        case .bodyLarge:
            return 7 // 22 - 15
        case .bodyMedium:
            return 5 // 18 - 13
        case .labelLarge:
            return 3 // 16 - 13
        case .labelSmall:
            return 3 // 14 - 11
        }
    }
}

public struct RoomieFontTokens {
    public let displayLarge: Font = RoomieTextStyle.displayLarge.font
    public let displayMedium: Font = RoomieTextStyle.displayMedium.font
    public let headlineLarge: Font = RoomieTextStyle.headlineLarge.font
    public let headlineMedium: Font = RoomieTextStyle.headlineMedium.font
    public let titleLarge: Font = RoomieTextStyle.titleLarge.font
    public let titleMedium: Font = RoomieTextStyle.titleMedium.font
    public let bodyLarge: Font = RoomieTextStyle.bodyLarge.font
    public let bodyMedium: Font = RoomieTextStyle.bodyMedium.font
    public let labelLarge: Font = RoomieTextStyle.labelLarge.font
    public let labelSmall: Font = RoomieTextStyle.labelSmall.font
}

public extension Font {
    static let roomie = RoomieFontTokens()
}

public struct RoomieTypographyModifier: ViewModifier {
    let style: RoomieTextStyle

    public func body(content: Content) -> some View {
        content
            .font(style.font)
            .tracking(style.tracking)
            .lineSpacing(style.lineSpacing)
    }
}

public extension View {
    func roomieFont(_ style: RoomieTextStyle) -> some View {
        modifier(RoomieTypographyModifier(style: style))
    }
}
