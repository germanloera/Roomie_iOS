import SwiftUI

// MARK: - Roomie Shapes

public enum RoomieRadius {
    public static let extraSmall: CGFloat = 8
    public static let small: CGFloat = 12
    public static let medium: CGFloat = 16
    public static let large: CGFloat = 24
    public static let extraLarge: CGFloat = 32
}

public enum RoomieShapes {
    public static let extraSmall = RoundedRectangle(cornerRadius: RoomieRadius.extraSmall, style: .continuous)
    public static let small = RoundedRectangle(cornerRadius: RoomieRadius.small, style: .continuous)
    public static let medium = RoundedRectangle(cornerRadius: RoomieRadius.medium, style: .continuous)
    public static let large = RoundedRectangle(cornerRadius: RoomieRadius.large, style: .continuous)
    public static let extraLarge = RoundedRectangle(cornerRadius: RoomieRadius.extraLarge, style: .continuous)
}
