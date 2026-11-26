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
                        label: "Nombre",
                        placeHolder: "",
                        text: $firstName
                    )
                    
                    InputWithLabel(
                        label: "Apellidos",
                        placeHolder: "",
                        text: $lastName
                    )
                    
                    InputWithLabel(
                        label: "Apodo (opcional)",
                        placeHolder: "",
                        text: $nickname
                    )
                    
                    InputWithLabel(
                        label: "Correo electrónico",
                        placeHolder: "",
                        text: $email
                    )
                    
                    InputWithLabel(
                        label: "Teléfono",
                        placeHolder: "",
                        text: $phone,
                        format: .phone(),
                        restrictions: [
                            .minLength(min: 10, message: "Debe incluir los 10 dígitos"),
                            
        
                        ]
                    )
                    
                    BaseListingCardSection(label: "Contactos de emergencia") {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Opcional. Estos números y parentescos serán visibles para el titular y los inquilinos del departamento.")
                                .font(.dmSans(.regular, size: 12))
                                .lineSpacing(16 - 12)
                                .foregroundStyle(Color.roomie.emergencyText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            BaseListingCardSection(label: "Contacto 1") {
                                VStack(alignment: .leading, spacing: 10) {
                                    InputWithLabel(
                                        label: "Nombre",
                                        placeHolder: "",
                                        text: $emergencyContact1Name
                                    )
                                    
                                    InputWithLabel(
                                        label: "Parentesco",
                                        placeHolder: "",
                                        text: $emergencyContact1Relationship
                                    )
                                    
                                    InputWithLabel(
                                        label: "Teléfono",
                                        placeHolder: "",
                                        text: $emergencyContact1Phone,
                                        format: .phone(),
                                        restrictions: [
                                            .minLength(min: 10, message: "Debe incluir los 10 dígitos")
                                        ]
                                    )
                                }
                            }
                            
                            BaseListingCardSection(label: "Contacto 2") {
                                VStack(alignment: .leading, spacing: 10) {
                                    InputWithLabel(
                                        label: "Nombre",
                                        placeHolder: "",
                                        text: $emergencyContact2Name
                                    )
                                    
                                    InputWithLabel(
                                        label: "Parentesco",
                                        placeHolder: "",
                                        text: $emergencyContact2Relationship
                                    )
                                    
                                    InputWithLabel(
                                        label: "Teléfono",
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
