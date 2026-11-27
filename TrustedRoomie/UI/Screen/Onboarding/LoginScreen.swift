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
            
            Text("auth.login.title")
                .font(.fraunces(.regular, size: 32))
                .lineSpacing(40 - 32)
                .foregroundStyle(Color.roomie.ink)
            
            Text("auth.login.subtitle")
                .font(.dmSans(.regular, size: 14))
                .lineSpacing(20 - 14)
                .foregroundStyle(Color.roomie.mute)
            
            InputWithLabel(
                label: "auth.login.email_label",
                placeHolder: "auth.login.email_placeholder",
                text: $email
            )
            
            InputWithLabel(
                label: "auth.login.password_label",
                placeHolder: "",
                text: $password
            )
            
            Button {
            
                    router?.navigate(to: OnboardingRoute.PasswordRecovery)
                
            } label: {
                Text("auth.login.forgot_password")
                    .font(.dmSans(.semiBold, size: 14))
                    .lineSpacing(20 - 14)
                    .foregroundStyle(Color.roomie.pine)
                    .multilineTextAlignment(.center)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, alignment: .center)
            
            GreenCTAButton(text: "auth.login.sign_in_button") {
          
                    router?.popToRoot()
                
            }
            .frame(maxWidth: .infinity)
            
            BeigeButton(text: "auth.signin.cta") {
           
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
