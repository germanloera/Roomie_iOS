import SwiftUI

/// Pantalla vacía de ejemplo para demostrar y servir como base de navegación.
public struct EmptyExampleView: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    public var title: String

    public init(title: String = "Pantalla de Ejemplo") {
        self.title = title
    }

    public var body: some View {
        VStack(spacing: 24) {
            Spacer()

            ContentUnavailableView {
                Label(title, systemImage: "arrow.triangle.branch")
                    .roomieFont(.headlineLarge)
                    .foregroundStyle(Color.roomie.ink)
            } description: {
                Text("Esta es una pantalla vacía de ejemplo. Puedes usar este patrón como base para agregar nuevas rutas y vistas en tu app.")
                    .roomieFont(.bodyMedium)
                    .foregroundStyle(Color.roomie.mute)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }

            // Ejemplo de navegación programática para regresar
            Button {
                router?.pop()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                    Text("Volver a la pantalla principal")
                }
            }
            .buttonStyle(RoomiePineButtonStyle())

            Spacer()
        }
        .padding()
        .roomieBackground()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EmptyExampleView()
    }
}
