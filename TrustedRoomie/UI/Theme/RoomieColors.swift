import SwiftUI
import UIKit

// MARK: - Color Hex Initializers

public extension Color {
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

    /// Crea un color dinámico adaptativo para Light y Dark Mode usando referencias de `Color`.
    static func dynamic(light: Color, dark: Color) -> Color {
        Color(uiColor: UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(dark)
            default:
                return UIColor(light)
            }
        })
    }
}

// MARK: - Roomie Primitives

public enum RoomiePalette {
    // Verdes / Pinos (Identidad principal)
    public static let pinePrimaryLight = Color(hex: 0x1F4D45)
    public static let pinePrimaryDark = Color(hex: 0x42A190)
    public static let pineSecondaryLight = Color(hex: 0x2D6A5F)
    public static let pineSecondaryDark = Color(hex: 0x34887A)
    public static let pineSecondary = pineSecondaryLight
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
    public static let colorClay = clayPrimaryLight

    // Fondos y Superficies Cálidas
    public static let paperLight = Color(hex: 0xF4F2EC)
    public static let paperDark = Color(hex: 0x121816)
    public static let cardLight = Color(hex: 0xFFFDF9)
    public static let cardDark = Color(hex: 0x18211E)
    public static let cardGlassLight = Color(argb: 0xA3FFFFFF) // 64% White glass
    public static let cardGlassDark = Color(argb: 0xC218211E)  // 76% Dark glass

    // Textos y Neutros
    public static let inkLight = Color(hex: 0x1F2A27)
    public static let inkDark = Color(hex: 0xF0F4F2)
    public static let muteLight = Color(hex: 0x7A837F)
    public static let muteDark = Color(hex: 0x9AA5A1)
    public static let ColorInk = inkLight
    public static let ColorMute = muteLight

    // Bordes y Superficies Auxiliares
    public static let lineLight = Color(hex: 0xE6DECE)
    public static let lineDark = Color(hex: 0x2A3834)
    public static let sandLight = Color(hex: 0xEFE6D6)
    public static let sandDark = Color(hex: 0x1A2421)
    public static let ColorSand = sandLight
    public static let sageLight = Color(hex: 0xDCE6DD)
    public static let sageDark = Color(hex: 0x1E2C28)

    // Estados de Validación
    public static let okLight = Color(hex: 0x2E7D55)
    public static let okDark = Color(hex: 0x38A169)
    public static let warnLight = Color(hex: 0xB7791F)
    public static let warnDark = Color(hex: 0xD69E2E)
    public static let errorLight = Color(hex: 0xBA1A1A)
    public static let errorDark = Color(hex: 0xFFB4AB)

    // Rating / Estrellas
    public static let starYellowLight = Color(hex: 0xFFFFC700)
    public static let starYellowDark = Color(hex: 0xFFFFD54F)

    // Chips
    public static let chipGreenLight = Color(hex: 0xD0FAE5)
    public static let chipGreenDark = Color(hex: 0x144D3A)
    public static let chipGreenTextLight = Color(hex: 0x006045)
    public static let chipGreenTextDark = Color(hex: 0x6EE7B7)

    public static let chipYellowLight = Color(hex: 0xFEF3C6)
    public static let chipYellowDark = Color(hex: 0xFEF3C6)
    public static let chipYellowTextLight = Color(hex: 0x973C00)
    public static let chipYellowTextDark = Color(hex: 0x973C00)

    // Inputs & Glass
    public static let inputBorderLight = Color(argb: 0xB8FFFFFF)
    public static let inputBorderDark = Color(argb: 0x33FFFFFF)
    public static let inputBgLight = Color(argb: 0x8CFFFFFF)
    public static let inputBgDark = Color(argb: 0x1AFFFFFF)
    public static let buttonGlassLight = Color.white.opacity(0.55)
    public static let buttonGlassDark = Color.white.opacity(0.15)

    // Gradientes de Fotos
    public static let photoGradientStartLight = Color(hex: 0xB3DBC7)
    public static let photoGradientEndLight = Color(hex: 0x69BFB8)
    public static let photoGradientStartDark = Color(hex: 0x1E3A33)
    public static let photoGradientEndDark = Color(hex: 0x2D6A5F)

    // Mapa & Mensajes
    public static let colorMapBg = Color(hex: 0xE8EADC)
    public static let mapBg = colorMapBg
    public static let colorMapBorder = lineLight
    public static let mapBorder = colorMapBorder
    public static let messageText = Color.white
    public static let messageTime = Color(argb: 0x99FFFFFF)
    public static let messageTextDark = Color.white
    public static let messageTimeDark = Color(argb: 0x99FFFFFF)

    // Alpha colors / Helpers
    public static let white_A68 = Color.white.opacity(0.68)
    public static let beige_A45_D6 = Color(hex: 0xEFE6D6).opacity(0.75)
    public static let white_A78 = Color.white.opacity(0.78)
    public static let white_A45 = Color.white.opacity(0.45)

    // Acciones destructivas / Salir (Cerrar sesión)
    public static let destructiveLight = Color(hex: 0xE7000B)
    public static let destructiveDark = Color(hex: 0xFFB4AB)
    public static let destructiveContainerLight = Color(hex: 0xFFFFC9C9)
    public static let destructiveContainerDark = Color(hex: 0x410002)

    // Contactos de emergencia y advertencias críticas
    public static let emergencyTextLight = Color(hex: 0xC10007)
    public static let emergencyTextDark = Color(hex: 0xFFFF897D)
    public static let emergencyContainerLight = Color(hex: 0xFEF2F2)
    public static let emergencyContainerDark = Color(hex: 0x2C1516)

    // Bordes de tarjetas y superficies glass
    public static let cardBorderLight = Color(argb: 0xADFFFFFF)
    public static let cardBorderDark = Color.white.opacity(0.10)

    // Scrim modal & Nav Glass
    public static let scrimColor = Color.black.opacity(0.6)
    public static let colorNavGlass = Color(argb: 0x94FFFFFF)

    // Notificación de solicitud de salida (Leaving Request Notification)
    public static let leavingRequestBgLight = Color(hex: 0xFFF7ED)
    public static let leavingRequestBgDark = Color(hex: 0x2C1C14)
    public static let leavingRequestBorderLight = Color(argb: 0x66C8643B)
    public static let leavingRequestBorderDark = Color(argb: 0x66E07A50)
    public static let leavingRequestShadowLight = Color(argb: 0x141F2A27)
    public static let leavingRequestShadowDark = Color(argb: 0x40000000)

    // Notificación informativa de invitación (SendInvite)
    public static let inviteNoticeBgLight = Color(argb: 0xBFDCE6DD)
    public static let inviteNoticeBgDark = Color(argb: 0xBF1E3830)

    // Tarjeta verde de cabecera (HomeGreenHeaderCard)
    public static let homeGreenCardBgLight = Color(hex: 0x0C2B25)
    public static let homeGreenCardBgDark = Color(hex: 0x162E29)
    public static let homeGreenCardTextLight = Color.white
    public static let homeGreenCardTextDark = Color.white
    public static let homeGreenCardSubtitleLight = Color(argb: 0xCCFFFFFF)
    public static let homeGreenCardSubtitleDark = Color(argb: 0xB3FFFFFF)

    // Gradients
    public static let DarkCardGradientStart = Color(hex: 0x1C2726)
    public static let DarkCardGradientEnd = Color(hex: 0x141D1A)

    public static let cardContainerGradientLight = LinearGradient(
        colors: [
            white_A78,
            white_A45
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    public static let cardDarkContainerGradient = LinearGradient(
        colors: [
            DarkCardGradientStart.opacity(0.84),
            DarkCardGradientEnd.opacity(0.68)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    public static let cardContainerGradientDark = cardDarkContainerGradient
    public static let cardContainerGradient = cardContainerGradientLight

    public static let cardContainerGradientDynamic = LinearGradient(
        colors: [
            .dynamic(light: white_A78, dark: DarkCardGradientStart.opacity(0.84)),
            .dynamic(light: white_A45, dark: DarkCardGradientEnd.opacity(0.68))
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    public static let White_AC2 = Color(argb: 0xC2FFFFFF)
    public static let Beige_E9 = Color(argb: 0xB2F6F1E9)
    public static let Green1B = Color(red: 0.09, green: 0.12, blue: 0.11)
    public static let Black12 = Color(red: 0.05, green: 0.08, blue: 0.07)

    public static let ScreenBgBrushLight = LinearGradient(
        stops: [
            Gradient.Stop(color: White_AC2, location: 0.077),
            Gradient.Stop(color: Beige_E9, location: 0.923)
        ],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )

    public static let ScreenBgBrushDark = LinearGradient(
        stops: [
            Gradient.Stop(color: Green1B.opacity(0.92), location: 0.00),
            Gradient.Stop(color: Black12.opacity(0.86), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.37, y: 0),
        endPoint: UnitPoint(x: 0.63, y: 1)
    )

    public static var ScreenBgBrush: LinearGradient {
        ScreenBgBrushLight
    }

    public static let screenBgBrushDynamic = LinearGradient(
        stops: [
            Gradient.Stop(color: .dynamic(light: White_AC2, dark: Green1B.opacity(0.92)), location: 0.077),
            Gradient.Stop(color: .dynamic(light: Beige_E9, dark: Black12.opacity(0.86)), location: 0.923)
        ],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )
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

    public let star: Color
    public let chipGreen: Color
    public let chipGreenText: Color
    public let inputBorder: Color
    public let inputBackground: Color
    public let buttonGlass: Color
    public let photoGradientStart: Color
    public let photoGradientEnd: Color

    public let cardContainerGradient: LinearGradient
    public let screenBgBrush: LinearGradient

    public let messageText: Color
    public let messageTime: Color
    public let chipYellow: Color
    public let chipYellowText: Color

    public let destructive: Color
    public let destructiveContainer: Color
    public let emergencyText: Color
    public let emergencyContainer: Color
    public let cardBorder: Color
    public let leavingRequestBackground: Color
    public let leavingRequestBorder: Color
    public let leavingRequestShadow: Color
    public let inviteNoticeBackground: Color
    public let homeGreenCardBackground: Color
    public let homeGreenCardText: Color
    public let homeGreenCardSubtitle: Color

    public init(
        pine: Color,
        pine2: Color,
        pineContainer: Color = RoomiePalette.pineContainerLight,
        onPineContainer: Color = RoomiePalette.onPineContainerLight,
        clay: Color,
        clayContainer: Color = RoomiePalette.clayContainerLight,
        onClayContainer: Color = RoomiePalette.onClayContainerLight,
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
        error: Color = RoomiePalette.errorLight,
        star: Color = RoomiePalette.starYellowLight,
        chipGreen: Color = RoomiePalette.chipGreenLight,
        chipGreenText: Color = RoomiePalette.chipGreenTextLight,
        inputBorder: Color = RoomiePalette.inputBorderLight,
        inputBackground: Color = RoomiePalette.inputBgLight,
        buttonGlass: Color = RoomiePalette.buttonGlassLight,
        photoGradientStart: Color = RoomiePalette.photoGradientStartLight,
        photoGradientEnd: Color = RoomiePalette.photoGradientEndLight,
        cardContainerGradient: LinearGradient = RoomiePalette.cardContainerGradient,
        screenBgBrush: LinearGradient = RoomiePalette.ScreenBgBrush,
        messageText: Color = RoomiePalette.messageText,
        messageTime: Color = RoomiePalette.messageTime,
        chipYellow: Color = RoomiePalette.chipYellowLight,
        chipYellowText: Color = RoomiePalette.chipYellowTextLight,
        destructive: Color = RoomiePalette.destructiveLight,
        destructiveContainer: Color = RoomiePalette.destructiveContainerLight,
        emergencyText: Color = RoomiePalette.emergencyTextLight,
        emergencyContainer: Color = RoomiePalette.emergencyContainerLight,
        cardBorder: Color = RoomiePalette.cardBorderLight,
        leavingRequestBackground: Color = RoomiePalette.leavingRequestBgLight,
        leavingRequestBorder: Color = RoomiePalette.leavingRequestBorderLight,
        leavingRequestShadow: Color = RoomiePalette.leavingRequestShadowLight,
        inviteNoticeBackground: Color = RoomiePalette.inviteNoticeBgLight,
        homeGreenCardBackground: Color = RoomiePalette.homeGreenCardBgLight,
        homeGreenCardText: Color = RoomiePalette.homeGreenCardTextLight,
        homeGreenCardSubtitle: Color = RoomiePalette.homeGreenCardSubtitleLight
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
        self.star = star
        self.chipGreen = chipGreen
        self.chipGreenText = chipGreenText
        self.inputBorder = inputBorder
        self.inputBackground = inputBackground
        self.buttonGlass = buttonGlass
        self.photoGradientStart = photoGradientStart
        self.photoGradientEnd = photoGradientEnd
        self.cardContainerGradient = cardContainerGradient
        self.screenBgBrush = screenBgBrush
        self.messageText = messageText
        self.messageTime = messageTime
        self.chipYellow = chipYellow
        self.chipYellowText = chipYellowText
        self.destructive = destructive
        self.destructiveContainer = destructiveContainer
        self.emergencyText = emergencyText
        self.emergencyContainer = emergencyContainer
        self.cardBorder = cardBorder
        self.leavingRequestBackground = leavingRequestBackground
        self.leavingRequestBorder = leavingRequestBorder
        self.leavingRequestShadow = leavingRequestShadow
        self.inviteNoticeBackground = inviteNoticeBackground
        self.homeGreenCardBackground = homeGreenCardBackground
        self.homeGreenCardText = homeGreenCardText
        self.homeGreenCardSubtitle = homeGreenCardSubtitle
    }

    /// Dynamic tokens that automatically adapt to the user's interface style (light / dark mode)
    public static let dynamic = RoomieColorTokens(
        pine: .dynamic(light: RoomiePalette.pinePrimaryLight, dark: RoomiePalette.pinePrimaryDark),
        pine2: .dynamic(light: RoomiePalette.pineSecondaryLight, dark: RoomiePalette.pineSecondaryDark),
        pineContainer: .dynamic(light: RoomiePalette.pineContainerLight, dark: RoomiePalette.pineContainerDark),
        onPineContainer: .dynamic(light: RoomiePalette.onPineContainerLight, dark: RoomiePalette.onPineContainerDark),
        clay: .dynamic(light: RoomiePalette.clayPrimaryLight, dark: RoomiePalette.clayPrimaryDark),
        clayContainer: .dynamic(light: RoomiePalette.clayContainerLight, dark: RoomiePalette.clayContainerDark),
        onClayContainer: .dynamic(light: RoomiePalette.onClayContainerLight, dark: RoomiePalette.onClayContainerDark),
        sage: .dynamic(light: RoomiePalette.sageLight, dark: RoomiePalette.sageDark),
        sand: .dynamic(light: RoomiePalette.sandLight, dark: RoomiePalette.sandDark),
        paper: .dynamic(light: RoomiePalette.paperLight, dark: RoomiePalette.paperDark),
        card: .dynamic(light: RoomiePalette.cardLight, dark: RoomiePalette.cardDark),
        cardGlass: .dynamic(light: RoomiePalette.cardGlassLight, dark: RoomiePalette.cardGlassDark),
        ink: .dynamic(light: RoomiePalette.inkLight, dark: RoomiePalette.inkDark),
        mute: .dynamic(light: RoomiePalette.muteLight, dark: RoomiePalette.muteDark),
        line: .dynamic(light: RoomiePalette.lineLight, dark: RoomiePalette.lineDark),
        ok: .dynamic(light: RoomiePalette.okLight, dark: RoomiePalette.okDark),
        warn: .dynamic(light: RoomiePalette.warnLight, dark: RoomiePalette.warnDark),
        error: .dynamic(light: RoomiePalette.errorLight, dark: RoomiePalette.errorDark),
        star: .dynamic(light: RoomiePalette.starYellowLight, dark: RoomiePalette.starYellowDark),
        chipGreen: .dynamic(light: RoomiePalette.chipGreenLight, dark: RoomiePalette.chipGreenDark),
        chipGreenText: .dynamic(light: RoomiePalette.chipGreenTextLight, dark: RoomiePalette.chipGreenTextDark),
        inputBorder: .dynamic(light: RoomiePalette.inputBorderLight, dark: RoomiePalette.inputBorderDark),
        inputBackground: .dynamic(light: RoomiePalette.inputBgLight, dark: RoomiePalette.inputBgDark),
        buttonGlass: .dynamic(light: RoomiePalette.buttonGlassLight, dark: RoomiePalette.buttonGlassDark),
        photoGradientStart: .dynamic(light: RoomiePalette.photoGradientStartLight, dark: RoomiePalette.photoGradientStartDark),
        photoGradientEnd: .dynamic(light: RoomiePalette.photoGradientEndLight, dark: RoomiePalette.photoGradientEndDark),
        cardContainerGradient: RoomiePalette.cardContainerGradientDynamic,
        screenBgBrush: RoomiePalette.screenBgBrushDynamic,
        messageText: .dynamic(light: RoomiePalette.messageText, dark: RoomiePalette.messageTextDark),
        messageTime: .dynamic(light: RoomiePalette.messageTime, dark: RoomiePalette.messageTimeDark),
        chipYellow: .dynamic(light: RoomiePalette.chipYellowLight, dark: RoomiePalette.chipYellowDark),
        chipYellowText: .dynamic(light: RoomiePalette.chipYellowTextLight, dark: RoomiePalette.chipYellowTextDark),
        destructive: .dynamic(light: RoomiePalette.destructiveLight, dark: RoomiePalette.destructiveDark),
        destructiveContainer: .dynamic(light: RoomiePalette.destructiveContainerLight, dark: RoomiePalette.destructiveContainerDark),
        emergencyText: .dynamic(light: RoomiePalette.emergencyTextLight, dark: RoomiePalette.emergencyTextDark),
        emergencyContainer: .dynamic(light: RoomiePalette.emergencyContainerLight, dark: RoomiePalette.emergencyContainerDark),
        cardBorder: .dynamic(light: RoomiePalette.cardBorderLight, dark: RoomiePalette.cardBorderDark),
        leavingRequestBackground: .dynamic(light: RoomiePalette.leavingRequestBgLight, dark: RoomiePalette.leavingRequestBgDark),
        leavingRequestBorder: .dynamic(light: RoomiePalette.leavingRequestBorderLight, dark: RoomiePalette.leavingRequestBorderDark),
        leavingRequestShadow: .dynamic(light: RoomiePalette.leavingRequestShadowLight, dark: RoomiePalette.leavingRequestShadowDark),
        inviteNoticeBackground: .dynamic(light: RoomiePalette.inviteNoticeBgLight, dark: RoomiePalette.inviteNoticeBgDark),
        homeGreenCardBackground: .dynamic(light: RoomiePalette.homeGreenCardBgLight, dark: RoomiePalette.homeGreenCardBgDark),
        homeGreenCardText: .dynamic(light: RoomiePalette.homeGreenCardTextLight, dark: RoomiePalette.homeGreenCardTextDark),
        homeGreenCardSubtitle: .dynamic(light: RoomiePalette.homeGreenCardSubtitleLight, dark: RoomiePalette.homeGreenCardSubtitleDark)
    )

    public static let light = RoomieColorTokens(
        pine: RoomiePalette.pinePrimaryLight,
        pine2: RoomiePalette.pineSecondaryLight,
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
        error: RoomiePalette.errorLight,
        star: RoomiePalette.starYellowLight,
        chipGreen: RoomiePalette.chipGreenLight,
        chipGreenText: RoomiePalette.chipGreenTextLight,
        inputBorder: RoomiePalette.inputBorderLight,
        inputBackground: RoomiePalette.inputBgLight,
        buttonGlass: RoomiePalette.buttonGlassLight,
        photoGradientStart: RoomiePalette.photoGradientStartLight,
        photoGradientEnd: RoomiePalette.photoGradientEndLight,
        cardContainerGradient: RoomiePalette.cardContainerGradientLight,
        screenBgBrush: RoomiePalette.ScreenBgBrushLight,
        messageText: RoomiePalette.messageText,
        messageTime: RoomiePalette.messageTime,
        chipYellow: RoomiePalette.chipYellowLight,
        chipYellowText: RoomiePalette.chipYellowTextLight,
        destructive: RoomiePalette.destructiveLight,
        destructiveContainer: RoomiePalette.destructiveContainerLight,
        emergencyText: RoomiePalette.emergencyTextLight,
        emergencyContainer: RoomiePalette.emergencyContainerLight,
        cardBorder: RoomiePalette.cardBorderLight,
        leavingRequestBackground: RoomiePalette.leavingRequestBgLight,
        leavingRequestBorder: RoomiePalette.leavingRequestBorderLight,
        leavingRequestShadow: RoomiePalette.leavingRequestShadowLight,
        inviteNoticeBackground: RoomiePalette.inviteNoticeBgLight,
        homeGreenCardBackground: RoomiePalette.homeGreenCardBgLight,
        homeGreenCardText: RoomiePalette.homeGreenCardTextLight,
        homeGreenCardSubtitle: RoomiePalette.homeGreenCardSubtitleLight
    )

    public static let dark = RoomieColorTokens(
        pine: RoomiePalette.pinePrimaryDark,
        pine2: RoomiePalette.pineSecondaryDark,
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
        error: RoomiePalette.errorDark,
        star: RoomiePalette.starYellowDark,
        chipGreen: RoomiePalette.chipGreenDark,
        chipGreenText: RoomiePalette.chipGreenTextDark,
        inputBorder: RoomiePalette.inputBorderDark,
        inputBackground: RoomiePalette.inputBgDark,
        buttonGlass: RoomiePalette.buttonGlassDark,
        photoGradientStart: RoomiePalette.photoGradientStartDark,
        photoGradientEnd: RoomiePalette.photoGradientEndDark,
        cardContainerGradient: RoomiePalette.cardDarkContainerGradient,
        screenBgBrush: RoomiePalette.ScreenBgBrushDark,
        messageText: RoomiePalette.messageTextDark,
        messageTime: RoomiePalette.messageTimeDark,
        chipYellow: RoomiePalette.chipYellowDark,
        chipYellowText: RoomiePalette.chipYellowTextDark,
        destructive: RoomiePalette.destructiveDark,
        destructiveContainer: RoomiePalette.destructiveContainerDark,
        emergencyText: RoomiePalette.emergencyTextDark,
        emergencyContainer: RoomiePalette.emergencyContainerDark,
        cardBorder: RoomiePalette.cardBorderDark,
        leavingRequestBackground: RoomiePalette.leavingRequestBgDark,
        leavingRequestBorder: RoomiePalette.leavingRequestBorderDark,
        leavingRequestShadow: RoomiePalette.leavingRequestShadowDark,
        inviteNoticeBackground: RoomiePalette.inviteNoticeBgDark,
        homeGreenCardBackground: RoomiePalette.homeGreenCardBgDark,
        homeGreenCardText: RoomiePalette.homeGreenCardTextDark,
        homeGreenCardSubtitle: RoomiePalette.homeGreenCardSubtitleDark
    )
}

/// Typealias for Kotlin `RoomieColors` alignment
public typealias RoomieColors = RoomieColorTokens

// MARK: - RoomieTheme Namespace for Colors

public enum RoomieTheme {
    public static var colors: RoomieColorTokens {
        RoomieColorTokens.dynamic
    }
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
public let ColorSand = Color.roomie.sand
public let ColorInk = Color.roomie.ink
public let ColorMute = Color.roomie.mute
public let ColorClay = Color.roomie.clay
public let ColorSage = Color.roomie.sage
public let ColorChipGreen = Color.roomie.chipGreen
public let ColorChipGreenText = Color.roomie.chipGreenText
public let ChipGreen = ColorChipGreen
public let ChipGreenText = ColorChipGreenText
public let ColorStar = Color.roomie.star
public let CardPhotoBgStart = Color.roomie.photoGradientStart
public let CardPhotoBgEnd = Color.roomie.photoGradientEnd
public let ColorNavGlass = RoomiePalette.colorNavGlass
public let ColorMapBg = RoomiePalette.colorMapBg
public let ColorMapBorder = RoomiePalette.colorMapBorder
public let ScrimColor = RoomiePalette.scrimColor
public let White_A68 = RoomiePalette.white_A68
public let Beige_A45_D6 = RoomiePalette.beige_A45_D6
public let White_A78 = RoomiePalette.white_A78
public let White_A45 = RoomiePalette.white_A45

public let InkLight = RoomiePalette.inkLight
public let MuteLight = RoomiePalette.muteLight
public let PinePrimaryLight = RoomiePalette.pinePrimaryLight

public let LeavingRequestBgLight = RoomiePalette.leavingRequestBgLight
public let LeavingRequestBgDark = RoomiePalette.leavingRequestBgDark
public let LeavingRequestBorderLight = RoomiePalette.leavingRequestBorderLight
public let LeavingRequestBorderDark = RoomiePalette.leavingRequestBorderDark
public let LeavingRequestShadowLight = RoomiePalette.leavingRequestShadowLight
public let LeavingRequestShadowDark = RoomiePalette.leavingRequestShadowDark

public let InviteNoticeBgLight = RoomiePalette.inviteNoticeBgLight
public let InviteNoticeBgDark = RoomiePalette.inviteNoticeBgDark

public let HomeGreenCardBgLight = RoomiePalette.homeGreenCardBgLight
public let HomeGreenCardBgDark = RoomiePalette.homeGreenCardBgDark
public let HomeGreenCardTextLight = RoomiePalette.homeGreenCardTextLight
public let HomeGreenCardTextDark = RoomiePalette.homeGreenCardTextDark
public let HomeGreenCardSubtitleLight = RoomiePalette.homeGreenCardSubtitleLight
public let HomeGreenCardSubtitleDark = RoomiePalette.homeGreenCardSubtitleDark

public let ExtendedLightColors = RoomieColorTokens.light
public let ExtendedDarkColors = RoomieColorTokens.dark

internal var ScreenBgBrush: LinearGradient {
    RoomiePalette.ScreenBgBrush
}
