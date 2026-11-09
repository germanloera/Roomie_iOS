//
//  LoginGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

public enum OnboardingRoute: Hashable, Identifiable {
    
    case Login(title: String = "")
    case SignIn(title: String = "")
    case PasswordRecovery(title: String = "")
    case PasswordRecoveryConfirmation(title: String = "")
    
    public var id: String {
        switch self {
        case .Login(title: _):
            return "Login"
        
        case .SignIn(title: _):
            return "SignIn"
        case .PasswordRecovery(title: _):
            return "PasswordRecovery"
        case .PasswordRecoveryConfirmation(title: _):
            return "PasswordRecoveryConfirmation"
    
        }
    }
    
}

extension View {
    
    func LoginGraph() -> some View {
    
        navigationDestination(for: OnboardingRoute.self){ route in
            
            switch route {
            case .Login(let title) : LoginScreen(title: title.isEmpty ? "Iniciar sesión" : title)
            case .SignIn(title: _): SignInScreen()
            case .PasswordRecovery(title: _): PasswordRecoveryScreen()
            case .PasswordRecoveryConfirmation(title: _): PasswordRecoveryConfirmationScreen()
                
            }
    
        }
        
    }
    
    
}
