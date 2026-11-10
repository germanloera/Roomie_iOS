//
//  ListingPhotoSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

/// Sección de fotos de un listing con imagen principal y fila de tres imágenes secundarias.
/// Equivalente en SwiftUI al composable `ListingPhotoSection` de Jetpack Compose.
public struct ListingPhotoSection: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public init() {}

    public var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("listing_placeholder_large")
                .resizable()
                .aspectRatio(1.7, contentMode: .fit)
                .frame(maxWidth: .infinity)

            HStack(spacing: 0) {
                Image("listing_placeholder_small_green")
                    .resizable()
                    .aspectRatio(1.7, contentMode: .fit)
                    .frame(maxWidth: .infinity)

                Image("listing_placeholder_small_blue")
                    .resizable()
                    .aspectRatio(1.7, contentMode: .fit)
                    .frame(maxWidth: .infinity)

                Image("listing_placeholder_small_purple")
                    .resizable()
                    .aspectRatio(1.7, contentMode: .fit)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack {
            ListingPhotoSection()
        }
        .padding()
    }
}
