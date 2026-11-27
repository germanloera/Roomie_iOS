//
//  ScreenTopBar.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Barra superior de navegación reutilizable para pantallas de Roomie con título, subtítulo opcional y botón de regreso.
/// Equivalente en SwiftUI a `TopBar` de Jetpack Compose (`ui.components.common`).
public struct ScreenTopBar: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: LocalizedText
    public var subtitle: LocalizedText?
    public var onBackTap: (() -> Void)?

    public init(
        title: LocalizedText = "",
        subtitle: LocalizedText? = nil,
        onBackTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.onBackTap = onBackTap
    }

    
    public init(
        title: String,
        subtitle: String? = nil,
        onBackTap: (() -> Void)? = nil
    ) {
        self.init(
            title: LocalizedText(title),
            subtitle: subtitle.map { LocalizedText($0) },
            onBackTap: onBackTap
        )
    }

    public var body: some View {
        HStack(spacing: 12) {
            Button {
                if let onBackTap {
                    onBackTap()
                } else {
                    router?.pop()
                }
            } label: {
                Image("back_btn")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.roomie.ink)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .accessibilityLabel(Text("common.back"))

            if !title.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    title.text
                        .font(.fraunces(.semiBold, size: 24))
                        .lineSpacing(30 - 24)
                        .foregroundStyle(Color.roomie.ink)
                        .lineLimit(1)

                    if let subtitle, !subtitle.isEmpty {
                        subtitle.text
                            .font(.dmSans(.regular, size: 12))
                            .lineSpacing(16 - 12)
                            .foregroundStyle(Color.roomie.mute)
                            .lineLimit(1)
                    }
                }
            }

            Spacer(minLength: 0)
        }
        .padding(.leading, 10)
        .padding(.trailing, 20)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.roomie.card)
    }
}

#Preview {
    VStack(spacing: 0) {
        ScreenTopBar(title: "Configuración")
        Divider()
        ScreenTopBar(title: "Editar Perfil", subtitle: "Información personal")
    }
}
