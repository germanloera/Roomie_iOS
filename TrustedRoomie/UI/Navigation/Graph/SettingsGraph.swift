//
//  SettingsGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

public enum SettingsRoute: Hashable, Identifiable {

    case Settings(title: String = "Preferencias")
    case PersonalInfoScreen(title: String = "Personal Info")
    case NotificationsScreen(title: String = "Notificaciones")
    case PrivacyScreen(title: String = "Privacidad")
    case ChangePasswordScreen(title: String = "Cambiar contraseña")
    
    public var id: String {
        switch self {
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
    
        }
    }

}

extension View {
    
    func SettingsGraph() -> some View {
    
        navigationDestination(for: SettingsRoute.self){ route in
            
            switch route {
            case .Settings(let title) : SettingsScreen().screenSetup(config: ScreenConfig(title: title))
            case .PersonalInfoScreen(let title): PersonalInfoScreen().screenSetup(config: ScreenConfig(title: title))
            case .NotificationsScreen(let title): NotificationsScreen().screenSetup(config: ScreenConfig(title: title))
            case .PrivacyScreen(let title): PrivacyScreen().screenSetup(config: ScreenConfig(title: title))
            case .ChangePasswordScreen(let title): ChangePasswordScreen() .screenSetup(config: ScreenConfig(title: title) )
                
            }
    
        }
        
    }
    
    
}
