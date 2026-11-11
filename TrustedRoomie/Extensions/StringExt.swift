//
//  StringExt.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

// MARK: - String Highlight Extension

public extension String {
    /// Resalta palabras clave dentro del texto devolviendo un `AttributedString` con colores y estilos tipográficos.
    /// Equivalente en SwiftUI a la función de extensión `String.highlight` de Jetpack Compose.
    ///
    /// - Parameters:
    ///   - words: Arreglo de palabras a resaltar en el texto.
    ///   - color: Color del texto para las palabras resaltadas.
    ///   - feedback: Si es `true`, aplica estilo cursiva con peso SemiBold (W600).
    ///               Si es `false`, aplica peso ExtraBold (W800 / StronglyEmphasized).
    ///   - font: Fuente opcional si se requiere sobreescribir la fuente base.
    /// - Returns: `AttributedString` compatible con `Text` y `BasicText` de SwiftUI.
    func highlight(
        words: [String],
        color: Color,
        feedback: Bool = false,
        font: Font? = nil
    ) -> AttributedString {
        let mStr = self
        var attributed = AttributedString(mStr)

        guard !mStr.isEmpty else { return attributed }

        for word in words where !word.isEmpty {
            // Buscamos todas las ocurrencias de la palabra
            var searchStart = attributed.startIndex
            while searchStart < attributed.endIndex,
                  let range = attributed[searchStart..<attributed.endIndex].range(of: word, options: [.caseInsensitive]) {

                attributed[range].foregroundColor = color

                if let font = font {
                    attributed[range].font = font
                } else {
                    if feedback {
                        // Equivalente a FontWeight.W600 + FontStyle.Italic
                        attributed[range].inlinePresentationIntent = [.stronglyEmphasized, .emphasized]
                    } else {
                        // Equivalente a FontWeight.W800 + TextDecoration.None
                        attributed[range].inlinePresentationIntent = [.stronglyEmphasized]
                    }
                }

                searchStart = range.upperBound
            }
        }

        return attributed
    }

    /// Sobrecarga variádica para mayor comodidad al resaltar palabras separadas por coma.
    func highlight(
        _ words: String...,
        color: Color,
        feedback: Bool = false,
        font: Font? = nil
    ) -> AttributedString {
        highlight(words: words, color: color, feedback: feedback, font: font)
    }
}

// MARK: - BasicText (Compose Equivalent)

/// Componente equivalente en SwiftUI a `BasicText` de Jetpack Compose.
/// Permite renderizar directamente cadenas `AttributedString` con soporte nativo de estilos.
public struct BasicText: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var text: AttributedString

    public init(_ text: AttributedString) {
        self.text = text
    }

    public init(_ string: String) {
        self.text = AttributedString(string)
    }

    public var body: some View {
        Text(text)
    }
}

// MARK: - Preview

#Preview {
    VStack(alignment: .leading, spacing: 20) {
        Text("Normal highlight:")
            .font(.caption)
            // .foregroundStyle(.secondary)
            .foregroundStyle(Color.roomie.mute)

        Text("Encuentra roomies de confianza en tu ciudad"
            .highlight(
                words: ["roomies", "confianza"],
                color: ColorPine,
                feedback: false
            )
        )
        .font(.title2)

        Text("Feedback highlight (Italic + SemiBold):")
            .font(.caption)
            // .foregroundStyle(.secondary)
            .foregroundStyle(Color.roomie.mute)

        BasicText(
            "Verificación completada con éxito para nuevos perfiles"
                .highlight(
                    words: ["completada", "nuevos perfiles"],
                    // color: Color(hex: 0xC8643B),
                    color: Color.roomie.clay,
                    feedback: true
                )
        )
        .font(.body)
    }
    .padding()
}
