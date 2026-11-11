//
//  ProfileTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

struct ProfileTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 16) {
            
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    // .foregroundStyle(.white)
                    .foregroundStyle(Color.roomie.paper)
            }
            .frame(width: 64, height: 64)
            // .background(Color(red: 0.1, green: 0.14, blue: 0.13))
            .background(Color.roomie.pine)
            .cornerRadius(33554400)
            
            Text("Aún no tienes cuenta")
                .frauncesFont(.regular, size: 24)
              .multilineTextAlignment(.center)
              // .foregroundColor(Color(red: 0.94, green: 0.96, blue: 0.95))
              .foregroundStyle(Color.roomie.ink)
            
            Text("Inicia sesión para guardar tu historial, tus reseñas y contactar titulares.")
                .dmSansFont(.regular,  size: 14)
              .multilineTextAlignment(.center)
              // .foregroundColor(Color(red: 0.6, green: 0.65, blue: 0.63))
              .foregroundStyle(Color.roomie.mute)
              .frame(width: 306, alignment: .top) 
            
        
            GreenCTAButton(text: "Iniciar sesión o registrarte", 
                           onTap: {router?.navigate(to: OnboardingRoute.Login(title: "Inciar Sesion"))}
            ).frame(maxWidth: .infinity)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
