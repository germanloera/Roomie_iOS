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
        case .Login(title: let title):
            return "Login"
        
        case .SignIn(title: let title):
            return "SignIn"
        case .PasswordRecovery(title: let title):
            return "PasswordRecovery"
        case .PasswordRecoveryConfirmation(title: let title):
            return "PasswordRecoveryConfirmation"
    
        }
    }
    
}

extension View {
    
    func LoginGraph() -> some View {
    
        navigationDestination(for: OnboardingRoute.self){ route in
            
            switch route {
            case .Login(let title) : LoginScreen()
            case .SignIn(title: let title): SignInScreen()
            case .PasswordRecovery(title: let title): PasswordRecoveryScreen()
            case .PasswordRecoveryConfirmation(title: let title): PasswordRecoveryConfirmationScreen()
                
            }
    
        }
        
    }
    
    
}
