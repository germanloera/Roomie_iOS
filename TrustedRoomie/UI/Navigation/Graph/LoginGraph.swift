//
//  LoginGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

public enum OnboardingRoute: Hashable, Identifiable {
    case Login
    case SignIn
    case PasswordRecovery
    case PasswordRecoveryConfirmation
    
    public var id: String {
        switch self {
        case .Login:
            return "Login"
        case .SignIn:
            return "SignIn"
        case .PasswordRecovery:
            return "PasswordRecovery"
        case .PasswordRecoveryConfirmation:
            return "PasswordRecoveryConfirmation"
        }
    }
    
 
    
}

public typealias LoginRoute = OnboardingRoute

public extension View {
    func LoginGraph() -> some View {
        navigationDestination(for: OnboardingRoute.self) { route in
            switch route {
            case .Login:
                LoginScreen().screenSetup(config: ScreenConfig())
        
            case .PasswordRecovery:
                PasswordRecoveryScreen().screenSetup(config: ScreenConfig())
            case .PasswordRecoveryConfirmation:
                PasswordRecoveryConfirmationScreen().screenSetup(config: ScreenConfig())
            case .SignIn:
                SignInScreen().screenSetup(config: ScreenConfig())
            }
        }
    }
}
