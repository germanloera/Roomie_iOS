//
//  RateItem.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Tarjeta para calificar a un roomie o compañero con avatar de iniciales, nombre, barra de estrellas y comentario opcional.
/// Equivalente en SwiftUI al composable `RateItem` de Jetpack Compose (`ui.components.rate`).
public struct RateItem: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var initial: String
    public var name: String
    public var placeholder: String
    public var onRatingChanged: ((Float) -> Void)?
    public var onCommentChanged: ((String) -> Void)?

    @State private var rating: Float
    @State private var commentText: String = ""

    public init(
        initial: String = "M",
        name: String = "Diego Fernández",
        rating: Float = 4.0,
        placeholder: String = "Escribe una reseña o comentario...",
        onRatingChanged: ((Float) -> Void)? = nil,
        onCommentChanged: ((String) -> Void)? = nil
    ) {
        self.initial = initial
        self.name = name
        self._rating = State(initialValue: rating)
        self.placeholder = placeholder
        self.onRatingChanged = onRatingChanged
        self.onCommentChanged = onCommentChanged
    }

    public var body: some View {
        BaseCard {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: 8) {
                    // Avatar con inicial
                    ZStack {
                        Circle()
                            .fill(Color.roomie.warn)
                            .frame(width: 30, height: 30)

                        Text(initial)
                            .font(.dmSans(.semiBold, size: 11.4))
                            .lineSpacing(17.1 - 11.4)
                            .foregroundStyle(Color.roomie.messageText)
                    }
                    .frame(width: 30, height: 30)

                    // Nombre del usuario
                    Text(name)
                        .font(.dmSans(.semiBold, size: 14))
                        .lineSpacing(20 - 14)
                        .foregroundStyle(Color.roomie.ink)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Barra de estrellas
                    StarRatingBar(
                        rating: rating,
                        showRating: false
                    ) { newRating in
                        rating = newRating
                        onRatingChanged?(newRating)
                    }
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)

                Input(
                    placeHolder: placeholder,
                    text: $commentText,
                    onTextChanged: onCommentChanged
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 16) {
            RateItem()
        }
        .padding()
    }
}
