import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// MARK: - App Font Families & Weights

public enum AppFont {
    
    // MARK: - DM Sans
    public enum DMSans: String, CaseIterable {
        case thin = "DMSans-Thin"
        case extraLight = "DMSans-ExtraLight"
        case light = "DMSans-Light"
        case regular = "DMSans-Regular"
        case medium = "DMSans-Medium"
        case semiBold = "DMSans-SemiBold"
        case extraBold = "DMSans-ExtraBold"
        
        public var name: String { rawValue }
        
        public func font(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
            if let textStyle = textStyle {
                return .custom(rawValue, size: size, relativeTo: textStyle)
            } else {
                return .custom(rawValue, size: size)
            }
        }
        
        #if canImport(UIKit)
        public func uiFont(size: CGFloat) -> UIFont {
            UIFont(name: rawValue, size: size) ?? .systemFont(ofSize: size)
        }
        #endif
    }
    
    // MARK: - Fraunces (72pt)
    public enum Fraunces: String, CaseIterable {
        case thin = "Fraunces72pt-Thin"
        case light = "Fraunces72pt-Light"
        case regular = "Fraunces72pt-Regular"
        case semiBold = "Fraunces72pt-SemiBold"
        case bold = "Fraunces72pt-Bold"
        case black = "Fraunces72pt-Black"
        
        public var name: String { rawValue }
        
        public func font(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
            if let textStyle = textStyle {
                return .custom(rawValue, size: size, relativeTo: textStyle)
            } else {
                return .custom(rawValue, size: size)
            }
        }
        
        #if canImport(UIKit)
        public func uiFont(size: CGFloat) -> UIFont {
            UIFont(name: rawValue, size: size) ?? .systemFont(ofSize: size)
        }
        #endif
    }
}

// MARK: - SwiftUI Font Extensions

public extension Font {
    /// Creates a DM Sans custom font.
    /// - Parameters:
    ///   - weight: The weight style of DM Sans (default: `.regular`).
    ///   - size: The point size of the font.
    ///   - textStyle: Optional dynamic type text style to scale relative to.
    static func dmSans(_ weight: AppFont.DMSans = .regular, size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        weight.font(size: size, relativeTo: textStyle)
    }
    
    /// Creates a Fraunces custom font.
    /// - Parameters:
    ///   - weight: The weight style of Fraunces (default: `.regular`).
    ///   - size: The point size of the font.
    ///   - textStyle: Optional dynamic type text style to scale relative to.
    static func fraunces(_ weight: AppFont.Fraunces = .regular, size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        weight.font(size: size, relativeTo: textStyle)
    }
}

// MARK: - UIKit UIFont Extensions

#if canImport(UIKit)
public extension UIFont {
    /// Returns the DM Sans UIFont with fallback to system font.
    static func dmSans(_ weight: AppFont.DMSans = .regular, size: CGFloat) -> UIFont {
        weight.uiFont(size: size)
    }
    
    /// Returns the Fraunces UIFont with fallback to system font.
    static func fraunces(_ weight: AppFont.Fraunces = .regular, size: CGFloat) -> UIFont {
        weight.uiFont(size: size)
    }
}
#endif

// MARK: - SwiftUI View Modifiers

public extension View {
    /// Applies DM Sans font to the view.
    func dmSansFont(_ weight: AppFont.DMSans = .regular, size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> some View {
        self.font(.dmSans(weight, size: size, relativeTo: textStyle))
    }
    
    /// Applies Fraunces font to the view.
    func frauncesFont(_ weight: AppFont.Fraunces = .regular, size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> some View {
        self.font(.fraunces(weight, size: size, relativeTo: textStyle))
    }
}
