//
//  AppDestination.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import Foundation

/// Sealed class que define todos los destinos de navegación de la app.
/// Equivalente en SwiftUI a `AppDestinations` de Jetpack Compose (`ui.navigation`).
public enum AppDestination: Hashable, Identifiable, Sendable {
    case emptyExample(title: String = "Pantalla de Ejemplo")

    // ── Bottom-nav tabs ────────────────────────────────────────────────────────
    case Explore
    case Profile
    case Login
    case Home

    // ── Onboarding ─────────────────────────────────────────────────────────────
    case SignIn
    case PasswordRecovery
    case PasswordRecoveryConfirmation

    // ── Listing & Details ──────────────────────────────────────────────────────
    case ListingDetails
    case Messages

    // ── Settings ───────────────────────────────────────────────────────────────
    case Settings
    case PersonalInfoScreen
    case NotificationsScreen
    case PrivacyScreen
    case ChangePasswordScreen

    // ── Publish ────────────────────────────────────────────────────────────────
    case ProfilePublishPlace

    public var route: String {
        switch self {
        case .emptyExample(let title):
            return "emptyExample_\(title)"
        case .Explore:
            return "explore"
        case .Profile:
            return "profile"
        case .Login:
            return "Login"
        case .Home:
            return "Home"
        case .SignIn:
            return "SignIn"
        case .PasswordRecovery:
            return "PasswordRecovery"
        case .PasswordRecoveryConfirmation:
            return "PasswordRecoveryConfirmation"
        case .ListingDetails:
            return "ListingDetails"
        case .Messages:
            return "Messages"
        case .Settings:
            return "Settings"
        case .PersonalInfoScreen:
            return "PersonalInfoScreen"
        case .NotificationsScreen:
            return "NotificationsScreen"
        case .PrivacyScreen:
            return "PrivacyScreen"
        case .ChangePasswordScreen:
            return "ChangePasswordScreen"
        case .ProfilePublishPlace:
            return "ProfilePublishPlace"
        }
    }

    public var id: String {
        return route
    }
}

/// Alias para paridad directa con `AppDestinations` de Kotlin Compose.
public typealias AppDestinations = AppDestination
