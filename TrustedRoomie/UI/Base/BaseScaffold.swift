import SwiftUI

/// Estructura base de pantalla (Scaffold) que provee barra superior, fondo degradado,
/// área de contenido alineada y barra inferior opcional.
/// Equivalente en SwiftUI a `BaseScaffold` de Kotlin Compose.
public struct BaseScaffold<Content: View, BottomBar: View>: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var subtitle: String?
    public var scrollable: Bool
    public var onBackTap: (() -> Void)?
    public var bottomBar: BottomBar
    public var content: Content

    public init(
        title: String = "",
        subtitle: String? = nil,
        scrollable: Bool = false,
        onBackTap: (() -> Void)? = nil,
        @ViewBuilder bottomBar: () -> BottomBar,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.scrollable = scrollable
        self.onBackTap = onBackTap
        self.bottomBar = bottomBar()
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: 0) {
            ScreenTopBar(title: title, subtitle: subtitle) {
                if let onBackTap {
                    onBackTap()
                } else {
                    router?.pop()
                }
            }

            if scrollable {
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        content
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .top)
                }
                .scrollIndicators(.hidden)
            } else {
                VStack(alignment: .center, spacing: 16) {
                    content
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }

            bottomBar
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .bg()
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}

public extension BaseScaffold where BottomBar == EmptyView {
    init(
        title: String = "",
        subtitle: String? = nil,
        scrollable: Bool = false,
        onBackTap: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            title: title,
            subtitle: subtitle,
            scrollable: scrollable,
            onBackTap: onBackTap,
            bottomBar: { EmptyView() },
            content: content
        )
    }
}

#Preview {
    NavigationStack {
        BaseScaffold(
            title: "Mi Perfil",
            subtitle: "Subtítulo opcional",
            scrollable: true
        ) {
            Text("Contenido de prueba")
                .roomieFont(.bodyLarge)
                .foregroundStyle(Color.roomie.ink)
        }
    }
    .environment(NavigationRouter())
}
