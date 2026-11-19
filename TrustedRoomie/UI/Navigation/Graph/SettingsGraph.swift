//
//  SettingsGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

public enum SettingsRoute: Hashable, Identifiable {

    case Settings(title: String = "Preferencias")
    case PersonalInfoScreen(title: String = "")
    case NotificationsScreen(title: String = "")
    case PrivacyScreen(title: String = "")
    case ChangePasswordScreen(title: String = "")
    
    public var id: String {
        switch self {
        case .Settings(title: _):
            return "Settings"
        case .PersonalInfoScreen(title: _):
            return "PersonalInfoScreen"
        case .NotificationsScreen(title: _):
            return "NotificationsScreen"
        case .PrivacyScreen(title: _):
            return "PrivacyScreen"
        case .ChangePasswordScreen(title: _):
            return "ChangePasswordScreen"
    
        }
    }

}

extension View {
    
    func SettingsGraph() -> some View {
    
        navigationDestination(for: SettingsRoute.self){ route in
            
            switch route {
            case .Settings(let title) : SettingsScreen().bg().navigationTitle(title)
            case .PersonalInfoScreen(title: _): PersonalInfoScreen().bg()
            case .NotificationsScreen(title: _): NotificationsScreen().bg()
            case .PrivacyScreen(title: _): PrivacyScreen().bg()
            case .ChangePasswordScreen(title: _): ChangePasswordScreen().bg()
                
            }
    
        }
        
    }
    
    
}
