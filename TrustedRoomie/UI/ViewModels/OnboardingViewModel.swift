import Combine
import Orchard
import Foundation
import Observation
import SwiftUI

@Observable
@MainActor
public final class OnboardingViewModel {

    private let auth: any AuthRepository
    @ObservationIgnored private let authTaskHolder = TaskHolder()

    public init(auth: any AuthRepository = AuthRepositoryImpl.shared) {
        self.auth = auth
    }

    public func signUp(email: String, password: String, name: String, router: NavigationRouter) {
        Task {
            let result = await auth.signUp(email: email, password: password, name: name)

          
            switch result {
            case .success:
                i("Successufully")
                router.navigate(to: HomeRoute.Home())

            case .error(let message):
                e(message)
            }

        }

    }

    public func logIn(email: String, password: String, router: NavigationRouter) {
        Task {
            let result = await auth.signIn(email: email, password: password)


            switch result {
            case .success:
                router.popToRoot()
            case .error(let message):
                print(message)
            }

        }

    }
    
    
    public func logOut( router: NavigationRouter){
        Task{
            do{
                try await auth.signOut()
                router.popToRoot()
            }catch{
                e("Logout Error", error: error)
            }
            
        }
    }
    
    
    
    
    
    

}
