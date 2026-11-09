import SwiftUI
import UIKit

// MARK: - Color Hex Initializer

extension Color {
    init(hex: UInt64, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }

    init(argb: UInt64) {
        let alpha = Double((argb >> 24) & 0xFF) / 255.0
        let red = Double((argb >> 16) & 0xFF) / 255.0
        let green = Double((argb >> 8) & 0xFF) / 255.0
        let blue = Double(argb & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

private extension UIColor {
    convenience init(hex: UInt64, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    convenience init(argb: UInt64) {
        let alpha = CGFloat((argb >> 24) & 0xFF) / 255.0
        let red = CGFloat((argb >> 16) & 0xFF) / 255.0
        let green = CGFloat((argb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(argb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }
}

// MARK: - Roomie Primitives

public enum RoomiePalette {
    // Verdes / Pinos (Identidad principal)
    public static let pinePrimaryLight = Color(hex: 0x1F4D45)
    public static let pinePrimaryDark = Color(hex: 0x42A190)
    public static let pineSecondary = Color(hex: 0x2D6A5F)
    public static let pineContainerLight = Color(hex: 0xDCE6DD)
    public static let pineContainerDark = Color(hex: 0x1E3A33)
    public static let onPineContainerLight = Color(hex: 0x0C2B25)
    public static let onPineContainerDark = Color(hex: 0x97F3E0)
    public static let ColorPine = pinePrimaryLight

    // Terracota / Clay (Acento cálido de acciones y estados)
    public static let clayPrimaryLight = Color(hex: 0xC8643B)
    public static let clayPrimaryDark = Color(hex: 0xE07A50)
    public static let clayContainerLight = Color(hex: 0xFFE0D2)
    public static let clayContainerDark = Color(hex: 0x6A2B12)
    public static let onClayContainerLight = Color(hex: 0x3E180A)
    public static let onClayContainerDark = Color(hex: 0xFFFFDBCF)

    // Fondos y Superficies Cálidas
    public static let paperLight = Color(hex: 0xF4F2EC)
    public static let paperDark = Color(hex: 0x121816)
    public static let cardLight = Color(hex: 0xFFFDF9)
    public static let cardDark = Color(hex: 0x18211E)
    public static let cardGlassLight = Color(argb: 0xA3FFFFFF)
    public static let cardGlassDark = Color(argb: 0xC218211E)

    // Textos y Neutros
    public static let inkLight = Color(hex: 0x1F2A27)
    public static let inkDark = Color(hex: 0xF0F4F2)
    public static let muteLight = Color(hex: 0x7A837F)
    public static let muteDark = Color(hex: 0x9AA5A1)

    // Bordes y Superficies Auxiliares
    public static let lineLight = Color(hex: 0xE6DECE)
    public static let lineDark = Color(hex: 0x2A3834)
    public static let sandLight = Color(hex: 0xEFE6D6)
    public static let sandDark = Color(hex: 0x1A2421)
    public static let sageLight = Color(hex: 0xDCE6DD)
    public static let sageDark = Color(hex: 0x1E2C28)

    // Estados de Validación
    public static let okLight = Color(hex: 0x2E7D55)
    public static let okDark = Color(hex: 0x38A169)
    public static let warnLight = Color(hex: 0xB7791F)
    public static let warnDark = Color(hex: 0xD69E2E)
    public static let errorLight = Color(hex: 0xBA1A1A)
    public static let errorDark = Color(hex: 0xFFB4AB)

    // Gradients
    public static let cardContainerGradient = LinearGradient(
        colors: [
            Color.white.opacity(0.78),
            Color.white.opacity(0.45)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    public static let White_AC2 = Color(argb: 0xC2FFFFFF)
    public static let Beige_E9 = Color(argb: 0xB2F6F1E9)

    
    public static let Green1B = Color(red: 0.09, green: 0.12, blue: 0.11)
    public static let Black12 = Color(red: 0.05, green: 0.08, blue: 0.07)
    
    public static var ScreenBgBrush: LinearGradient {
        LinearGradient(
            stops: [
                Gradient.Stop(color: White_AC2, location: 0.077),
                Gradient.Stop(color: Beige_E9, location: 0.923)
            ],
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
    
    
    public static var ScreenBgBrushDark: LinearGradient {
        LinearGradient(
            stops: [
                Gradient.Stop(color:Green1B .opacity(0.92), location: 0.00),
                Gradient.Stop(color: Black12.opacity(0.86), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.37, y: 0),
            endPoint: UnitPoint(x: 0.63, y: 1)
        )
    }
}

// MARK: - Semantic Adaptive Colors

public struct RoomieColorTokens {
    public let pine: Color
    public let pine2: Color
    public let pineContainer: Color
    public let onPineContainer: Color

    public let clay: Color
    public let clayContainer: Color
    public let onClayContainer: Color

    public let sage: Color
    public let sand: Color
    public let paper: Color
    public let card: Color
    public let cardGlass: Color
    public let ink: Color
    public let mute: Color
    public let line: Color

    public let ok: Color
    public let warn: Color
    public let error: Color

    public init(
        pine: Color,
        pine2: Color,
        pineContainer: Color,
        onPineContainer: Color,
        clay: Color,
        clayContainer: Color,
        onClayContainer: Color,
        sage: Color,
        sand: Color,
        paper: Color,
        card: Color,
        cardGlass: Color,
        ink: Color,
        mute: Color,
        line: Color,
        ok: Color,
        warn: Color,
        error: Color
    ) {
        self.pine = pine
        self.pine2 = pine2
        self.pineContainer = pineContainer
        self.onPineContainer = onPineContainer
        self.clay = clay
        self.clayContainer = clayContainer
        self.onClayContainer = onClayContainer
        self.sage = sage
        self.sand = sand
        self.paper = paper
        self.card = card
        self.cardGlass = cardGlass
        self.ink = ink
        self.mute = mute
        self.line = line
        self.ok = ok
        self.warn = warn
        self.error = error
    }

    /// Dynamic tokens that automatically adapt to the user's interface style (light / dark mode)
    public static let dynamic = RoomieColorTokens(
        pine: Color(uiColor: .dynamic(light: UIColor(hex: 0xFF1F4D45), dark: UIColor(hex: 0x42A190))),
        pine2: Color(uiColor: .dynamic(light: UIColor(hex: 0x2D6A5F), dark: UIColor(hex: 0x34887A))),
        pineContainer: Color(uiColor: .dynamic(light: UIColor(hex: 0xDCE6DD), dark: UIColor(hex: 0x1E3A33))),
        onPineContainer: Color(uiColor: .dynamic(light: UIColor(hex: 0x0C2B25), dark: UIColor(hex: 0x97F3E0))),
        clay: Color(uiColor: .dynamic(light: UIColor(hex: 0xC8643B), dark: UIColor(hex: 0xE07A50))),
        clayContainer: Color(uiColor: .dynamic(light: UIColor(hex: 0xFFE0D2), dark: UIColor(hex: 0x6A2B12))),
        onClayContainer: Color(uiColor: .dynamic(light: UIColor(hex: 0x3E180A), dark: UIColor(hex: 0xFFFFDBCF))),
        sage: Color(uiColor: .dynamic(light: UIColor(hex: 0xDCE6DD), dark: UIColor(hex: 0x1E2C28))),
        sand: Color(uiColor: .dynamic(light: UIColor(hex: 0xEFE6D6), dark: UIColor(hex: 0x1A2421))),
        paper: Color(uiColor: .dynamic(light: UIColor(hex: 0xF4F2EC), dark: UIColor(hex: 0x121816))),
        card: Color(uiColor: .dynamic(light: UIColor(hex: 0xFFFDF9), dark: UIColor(hex: 0x18211E))),
        cardGlass: Color(uiColor: .dynamic(light: UIColor(argb: 0xA3FFFFFF), dark: UIColor(argb: 0xC218211E))),
        ink: Color(uiColor: .dynamic(light: UIColor(hex: 0x1F2A27), dark: UIColor(hex: 0xF0F4F2))),
        mute: Color(uiColor: .dynamic(light: UIColor(hex: 0x7A837F), dark: UIColor(hex: 0x9AA5A1))),
        line: Color(uiColor: .dynamic(light: UIColor(hex: 0xE6DECE), dark: UIColor(hex: 0x2A3834))),
        ok: Color(uiColor: .dynamic(light: UIColor(hex: 0x2E7D55), dark: UIColor(hex: 0x38A169))),
        warn: Color(uiColor: .dynamic(light: UIColor(hex: 0xB7791F), dark: UIColor(hex: 0xD69E2E))),
        error: Color(uiColor: .dynamic(light: UIColor(hex: 0xBA1A1A), dark: UIColor(hex: 0xFFB4AB)))
    )

    public static let light = RoomieColorTokens(
        pine: RoomiePalette.pinePrimaryLight,
        pine2: RoomiePalette.pineSecondary,
        pineContainer: RoomiePalette.pineContainerLight,
        onPineContainer: RoomiePalette.onPineContainerLight,
        clay: RoomiePalette.clayPrimaryLight,
        clayContainer: RoomiePalette.clayContainerLight,
        onClayContainer: RoomiePalette.onClayContainerLight,
        sage: RoomiePalette.sageLight,
        sand: RoomiePalette.sandLight,
        paper: RoomiePalette.paperLight,
        card: RoomiePalette.cardLight,
        cardGlass: RoomiePalette.cardGlassLight,
        ink: RoomiePalette.inkLight,
        mute: RoomiePalette.muteLight,
        line: RoomiePalette.lineLight,
        ok: RoomiePalette.okLight,
        warn: RoomiePalette.warnLight,
        error: RoomiePalette.errorLight
    )

    public static let dark = RoomieColorTokens(
        pine: RoomiePalette.pinePrimaryDark,
        pine2: Color(hex: 0x34887A),
        pineContainer: RoomiePalette.pineContainerDark,
        onPineContainer: RoomiePalette.onPineContainerDark,
        clay: RoomiePalette.clayPrimaryDark,
        clayContainer: RoomiePalette.clayContainerDark,
        onClayContainer: RoomiePalette.onClayContainerDark,
        sage: RoomiePalette.sageDark,
        sand: RoomiePalette.sandDark,
        paper: RoomiePalette.paperDark,
        card: RoomiePalette.cardDark,
        cardGlass: RoomiePalette.cardGlassDark,
        ink: RoomiePalette.inkDark,
        mute: RoomiePalette.muteDark,
        line: RoomiePalette.lineDark,
        ok: RoomiePalette.okDark,
        warn: RoomiePalette.warnDark,
        error: RoomiePalette.errorDark
    )
}

// MARK: - Color Extension for Fluent Access

public extension Color {
    static var roomie: RoomieColorTokens {
        RoomieColorTokens.dynamic
    }
}
// MARK: - Global Screen Background & Color Declarations

public let White_AC2 = RoomiePalette.White_AC2
public let Beige_E9 = RoomiePalette.Beige_E9
public let ColorPine = Color.roomie.pine

internal var ScreenBgBrush: LinearGradient {
    RoomiePalette.ScreenBgBrush
}


