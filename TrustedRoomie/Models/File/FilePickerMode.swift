//
//  FilePickerMode.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import UniformTypeIdentifiers

/// Modalidad de selección soportada por el selector unificado.
public enum FilePickerMode: Equatable, Sendable {
    /// Modo para seleccionar fotos de la fototeca con límite máximo configurable.
    case photos(maxSelection: Int = 10)

    /// Modo para seleccionar documentos con UTTypes configurables y soporte para selección múltiple.
    case documents(allowedTypes: [UTType] = [.item], allowMultiple: Bool = true)

    /// Tipos de documentos estándar para contratos, comprobantes e identificaciones.
    public static var defaultDocumentTypes: [UTType] {
        [.pdf, .image, .plainText, .data]
    }
}
