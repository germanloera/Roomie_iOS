//
//  LoginGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

public enum OnboardingRoute: Hashable, Identifiable {
    case Login(title: String = "")
    case SignIn(title: String = "Iniciar Sesión")
    case PasswordRecovery(title: String = "Recuperar Contraseña")
    case PasswordRecoveryConfirmation(title: String = "Recuperar Contraseña")

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
                LoginScreen().bg()
            case .SignIn(let title):
                SignInScreen().bg().navigationTitle(title)
            case .PasswordRecovery(let title):
                PasswordRecoveryScreen().bg().navigationTitle(title)
            case .PasswordRecoveryConfirmation(let title):
                PasswordRecoveryConfirmationScreen().bg().navigationTitle(title)
            }
        }
    }
}
