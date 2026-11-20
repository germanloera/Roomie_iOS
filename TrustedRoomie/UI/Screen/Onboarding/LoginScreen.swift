//
//  LoginScreen.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation


public struct LoginScreen: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 16)
        {
            Image("home_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
            
            Text("Comparte casa, con confianza")
                .font(.fraunces(.regular, size: 32))
                .lineSpacing(40 - 32)
                .foregroundStyle(Color.roomie.ink)
            
            Text("Inicia sesión para contactar titulares, recibir invitaciones y ver reseñas verificadas.")
                .font(.dmSans(.regular, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.mute)
            
            InputWithLabel(
                label: "Correo electrónico",
                placeHolder: "tu@correo.com",
                text: $email
            )
            
            InputWithLabel(
                label: "Contraseña",
                placeHolder: "",
                text: $password
            )
            
            Button {
            
                    router?.navigate(to: OnboardingRoute.PasswordRecovery)
                
            } label: {
                Text("¿Olvidaste tu contraseña?")
                    .font(.dmSans(.semiBold, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.pine)
                    .multilineTextAlignment(.center)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, alignment: .center)
            
            GreenCTAButton(text: "Iniciar sesión") {
          
                    router?.popToRoot()
                
            }
            .frame(maxWidth: .infinity)
            
            BeigeButton(text: "Crea tu cuenta") {
           
                    router?.navigate(to: OnboardingRoute.SignIn)
                
            }
            .frame(maxWidth: .infinity)
        }
        
    }
} 


#Preview {
    NavigationStack {
        LoginScreen()
    }
    .environment(NavigationRouter())
}
