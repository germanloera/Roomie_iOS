//
//  ListingLocationSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Sección de ubicación con mapa ilustrativo y mensaje informativo de privacidad.
/// Equivalente en SwiftUI al composable `ListingLocationSection` de Jetpack Compose.
public struct ListingLocationSection: View {
    public var title: String
    public var visibleZone: String

    public init(
        title: String = "Ubicación",
        visibleZone: String = "Roma Norte, CDMX"
    ) {
        self.title = title
        self.visibleZone = visibleZone
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.system(size: 13, weight: .bold))
                .dmSansFont(.bold, size: 13)
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color(red: 0x7A / 255.0, green: 0x83 / 255.0, blue: 0x7F / 255.0))

            ZStack {
                Image("ic_map_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 112)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 112)
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))

            LocationInfoMessage(visibleZone: visibleZone)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/// Mensaje informativo sobre la privacidad de la ubicación exacta.
/// Equivalente en SwiftUI al composable `LocationInfoMessage` de Jetpack Compose.
public struct LocationInfoMessage: View {
    public var visibleZone: String
    public var fullMessage: String

    public init(
        visibleZone: String = "Roma Norte, CDMX",
        fullMessage: String? = nil
    ) {
        self.visibleZone = visibleZone
        self.fullMessage = fullMessage ?? "Zona visible: \(visibleZone). La dirección exacta se comparte únicamente al concretar una visita o entrevista con el titular."
    }

    private var highlightedText: AttributedString {
        let prefix = "Zona visible: \(visibleZone)"
        return fullMessage.highlight(words: [prefix], color: .black)
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image("outline_lock_24")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)

            BasicText(highlightedText)
                .font(.system(size: 12, weight: .semibold))
                .dmSansFont(.semiBold, size: 12)
                .lineSpacing(16 - 12)
                .foregroundStyle(MuteLight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .background(
            Color(
                red: Double(0xEF) / 255.0,
                green: Double(0xE6) / 255.0,
                blue: Double(0xD6) / 255.0
            ).opacity(Double(0xBF) / 255.0)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            ListingLocationSection()
        }
        .padding()
    }
}
