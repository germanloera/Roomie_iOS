import SwiftUI

/// Barra superior de navegación reutilizable para pantallas de Roomie.
/// Equivalente en SwiftUI a `TopBar` de Kotlin Compose.
public struct ScreenTopBar: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var onBackTap: (() -> Void)?

    public init(
        title: String = "",
        onBackTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.onBackTap = onBackTap
    }

    public var body: some View {
        HStack(spacing: 12) {
            Button {
                onBackTap?()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color.roomie.ink)
                    .frame(width: 30, height: 30)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Regresar")

            if !title.isEmpty {
                Text(title)
                    .roomieFont(.headlineLarge)
                    .foregroundStyle(Color.roomie.ink)
                    .lineLimit(1)
            }

            Spacer(minLength: 0)
        }
        .padding(.leading, 10)
        .padding(.trailing, 20)
        .padding(.top, 8)
        .padding(.bottom, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.roomie.cardGlass)
    }
}

#Preview {
    VStack {
        ScreenTopBar(title: "Configuración") {
            print("Back tapped")
        }
        Spacer()
    }
    .background(RoomiePalette.cardContainerGradient)
}
