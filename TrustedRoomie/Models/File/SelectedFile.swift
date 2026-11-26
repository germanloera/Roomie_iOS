//
//  SelectedFile.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import UniformTypeIdentifiers

/// Estructura unificada que representa un archivo o imagen seleccionado por el usuario.
public struct SelectedFile: Identifiable, Equatable, Hashable, Sendable {
    public let id: UUID
    public let url: URL
    public let name: String
    public let sizeInBytes: Int64
    public let mimeType: String
    public let contentType: UTType?

    public init(
        id: UUID = UUID(),
        url: URL,
        name: String,
        sizeInBytes: Int64,
        mimeType: String,
        contentType: UTType? = nil
    ) {
        self.id = id
        self.url = url
        self.name = name
        self.sizeInBytes = sizeInBytes
        self.mimeType = mimeType
        self.contentType = contentType
    }

    /// Tamaño en bytes formateado de forma legible para el usuario (ej. "3.2 MB", "450 KB").
    public var formattedSize: String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useBytes, .useKB, .useMB, .useGB]
        formatter.countStyle = .file
        return formatter.string(fromByteCount: sizeInBytes)
    }

    /// Indica si el archivo seleccionado es una imagen basada en su tipo de contenido o extensión.
    public var isImage: Bool {
        if let type = contentType, type.conforms(to: .image) {
            return true
        }
        let ext = url.pathExtension.lowercased()
        return ["jpg", "jpeg", "png", "heic", "webp", "gif"].contains(ext)
    }

    /// Carga los datos binarios del archivo desde su URL local de forma segura.
    public func loadData() throws -> Data {
        try Data(contentsOf: url)
    }
}
