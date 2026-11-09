
import SwiftUI

/// Estructura base de pantalla (Scaffold) que provee barra superior, fondo degradado,
/// área de contenido alineada y barra inferior opcional.
/// Equivalente en SwiftUI a `BaseScaffold` de Kotlin Compose.
public struct HomeScaffold<Content: View, BottomBar: View>: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var onBackTap: (() -> Void)?
    public var bottomBar: BottomBar
    public var content: Content

    public init(
        title: String = "",
        onBackTap: (() -> Void)? = nil,
        @ViewBuilder bottomBar: () -> BottomBar,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.onBackTap = onBackTap
        self.bottomBar = bottomBar()
        self.content = content()
    }

    public var body: some View {
        
        
        ZStack {
          
            
            VStack(spacing: 0) {
                
                VStack(alignment: .center, spacing: 16) {
                    content
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
               
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .navigationBar)
            .bg()
        }
    }
}

public extension HomeScaffold where BottomBar == EmptyView {
    init(
        title: String = "",
        onBackTap: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            title: title,
            onBackTap: onBackTap,
            bottomBar: { EmptyView() },
            content: content
        )
    }
}





#Preview {
    NavigationStack {
        BaseScaffold(title: "Mi Perfil") {
            Text("Contenido de prueba")
                .roomieFont(.bodyLarge)
                .foregroundStyle(Color.roomie.ink)
        }
    }
    .environment(NavigationRouter())
}
