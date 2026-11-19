import SwiftUI

/// Modificador de vista que conecta `AppDestination` con su respectiva vista destino.
public struct AppNavigationDestinationModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .navigationDestination(for: AppDestination.self) { destination in
                switch destination {
                case .emptyExample(let title):
                    EmptyExampleView(title: title)
                case .Home:
                    HomeScreen().bg()
                case .ListingDetails:
                    ListingDetailScreen().bg()
                case .Explore:
                    ExploreTab().bg()
                case .Profile:
                    ProfileTab().bg()
                case .Login:
                    LoginScreen().bg()
                case .SignIn:
                    SignInScreen().bg()
                case .PasswordRecovery:
                    PasswordRecoveryScreen().bg()
                case .PasswordRecoveryConfirmation:
                    PasswordRecoveryConfirmationScreen().bg()
                case .Messages:
                    MessageScreen().bg()
                case .Settings:
                    SettingsScreen().bg()
                case .PersonalInfoScreen:
                    PersonalInfoScreen().bg()
                case .NotificationsScreen:
                    NotificationsScreen().bg()
                case .PrivacyScreen:
                    PrivacyScreen().bg()
                case .ChangePasswordScreen:
                    ChangePasswordScreen().bg()
                case .ProfilePublishPlace:
                    ListingCreateEditScreen().bg()
                }
            }
    }
}

public extension View {
    /// Agrega el manejador de destinos de navegación a la jerarquía de vistas.
    func withAppNavigation() -> some View {
        modifier(AppNavigationDestinationModifier())
    }
}
