//
//  PersonalInfoScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/13/26.
//

import SwiftUI

/// Pantalla para visualizar y editar datos personales e información de contacto del usuario.
/// Equivalente en SwiftUI al composable `PersonalInfoScreen` de Jetpack Compose (`ui.screen.settings`).
@MainActor
public struct PersonalInfoScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var nickname: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    
    // Contacto de emergencia 1
    @State private var emergencyContact1Name: String = ""
    @State private var emergencyContact1Relationship: String = ""
    @State private var emergencyContact1Phone: String = ""
    
    // Contacto de emergencia 2
    @State private var emergencyContact2Name: String = ""
    @State private var emergencyContact2Relationship: String = ""
    @State private var emergencyContact2Phone: String = ""
    
    public var onBackTap: (() -> Void)?
    
    public init(onBackTap: (() -> Void)? = nil) {
        self.onBackTap = onBackTap
    }
    
    public var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 13) {
                    InputWithLabel(
                        label: "settings.personal_info.first_name",
                        placeHolder: "",
                        text: $firstName
                    )
                    
                    InputWithLabel(
                        label: "settings.personal_info.last_name",
                        placeHolder: "",
                        text: $lastName
                    )
                    
                    InputWithLabel(
                        label: "settings.personal_info.nickname",
                        placeHolder: "",
                        text: $nickname
                    )
                    
                    InputWithLabel(
                        label: "auth.login.email_label",
                        placeHolder: "",
                        text: $email
                    )
                    
                    InputWithLabel(
                        label: "settings.personal_info.phone",
                        placeHolder: "",
                        text: $phone,
                        format: .phone(),
                        restrictions: [
                            .minLength(min: 10, message: "Debe incluir los 10 dígitos"),
                            
        
                        ]
                    )
                    
                    BaseListingCardSection(label: "settings.personal_info.emergency_contacts") {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("settings.personal_info.emergency_disclaimer")
                                .font(.dmSans(.regular, size: 12))
                                .lineSpacing(16 - 12)
                                .foregroundStyle(Color.roomie.emergencyText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            BaseListingCardSection(label: "settings.personal_info.contact_1") {
                                VStack(alignment: .leading, spacing: 10) {
                                    InputWithLabel(
                                        label: "settings.personal_info.first_name",
                                        placeHolder: "",
                                        text: $emergencyContact1Name
                                    )
                                    
                                    InputWithLabel(
                                        label: "settings.personal_info.relationship",
                                        placeHolder: "",
                                        text: $emergencyContact1Relationship
                                    )
                                    
                                    InputWithLabel(
                                        label: "settings.personal_info.phone",
                                        placeHolder: "",
                                        text: $emergencyContact1Phone,
                                        format: .phone(),
                                        restrictions: [
                                            .minLength(min: 10, message: "Debe incluir los 10 dígitos")
                                        ]
                                    )
                                }
                            }
                            
                            BaseListingCardSection(label: "settings.personal_info.contact_2") {
                                VStack(alignment: .leading, spacing: 10) {
                                    InputWithLabel(
                                        label: "settings.personal_info.first_name",
                                        placeHolder: "",
                                        text: $emergencyContact2Name
                                    )
                                    
                                    InputWithLabel(
                                        label: "settings.personal_info.relationship",
                                        placeHolder: "",
                                        text: $emergencyContact2Relationship
                                    )
                                    
                                    InputWithLabel(
                                        label: "settings.personal_info.phone",
                                        placeHolder: "",
                                        text: $emergencyContact2Phone,
                                        format: .phone(),
                                        restrictions: [
                                            .minLength(min: 10, message: "Debe incluir los 10 dígitos")
                                        ]
                                    )
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
        
    }
}

#Preview {
    NavigationStack {
        PersonalInfoScreen()
    }
    .environment(NavigationRouter())
}
