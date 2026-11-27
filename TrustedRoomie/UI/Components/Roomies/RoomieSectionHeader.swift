//
//  RoomieSectionHeader.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Encabezado de sección para listas de roomies con título en mayúsculas y acción de texto opcional a la derecha.
/// Equivalente en SwiftUI al composable `RoomieSectionHeader` de Jetpack Compose (`ui.components.roomies`).
public struct RoomieSectionHeader: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: LocalizedText
    public var rightText: LocalizedText
    public var onTap: (() -> Void)?

    public init(
        text: LocalizedText = "",
        rightText: LocalizedText = "",
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.rightText = rightText
        self.onTap = onTap
    }

    
    public init(
        text: String,
        rightText: String = "",
        onTap: (() -> Void)? = nil
    ) {
        self.init(
            text: LocalizedText(text),
            rightText: LocalizedText(rightText),
            onTap: onTap
        )
    }

    public var body: some View {
        HStack(alignment: .center) {
            text.text.textCase(.uppercase)
                .font(.dmSans(.semiBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            Spacer()

            if !rightText.isEmpty {
                Button {
                    onTap?()
                } label: {
                    rightText.text
                        .font(.dmSans(.semiBold, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.pine)
                        .multilineTextAlignment(.center)
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            RoomieSectionHeader(text: "Roomies actuales (3)", rightText: "+ Invitar")
            RoomieSectionHeader(text: "Solicitudes de salida (1)")
        }
        .padding()
    }
}
