//
//  FilePickerRepository.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import SwiftUI
import PhotosUI
import Observation
import UniformTypeIdentifiers

/// Repositorio unificado que procesa fotos de `PhotosPicker` y documentos de `UIDocumentPickerViewController`.
/// Gestiona la copia segura en el sandbox temporal de la app y extrae metadatos estandarizados.
@Observable
@MainActor
public final class FilePickerRepository: FilePickerRepositoryProtocol {
    public static let shared = FilePickerRepository()

    public private(set) var selectedFiles: [SelectedFile] = []
    public private(set) var isLoading: Bool = false
    public private(set) var lastError: String?

    public init() {}

    // MARK: - Procesamiento de Fotos (PhotosPicker)

    public func processPhotosPickerItems(_ items: [PhotosPickerItem]) async throws -> [SelectedFile] {
        isLoading = true
        lastError = nil
        var results: [SelectedFile] = []

        do {
            for item in items {
                if let data = try await item.loadTransferable(type: Data.self) {
                    let utType = item.supportedContentTypes.first ?? .image
                    let fileExtension = utType.preferredFilenameExtension ?? "jpg"
                    let mimeType = utType.preferredMIMEType ?? "image/jpeg"
                    let uniqueName = "photo_\(UUID().uuidString.prefix(8)).\(fileExtension)"
                    let targetURL = FileManager.default.temporaryDirectory.appendingPathComponent(uniqueName)

                    try data.write(to: targetURL, options: .atomic)

                    let selectedFile = SelectedFile(
                        url: targetURL,
                        name: uniqueName,
                        sizeInBytes: Int64(data.count),
                        mimeType: mimeType,
                        contentType: utType
                    )
                    results.append(selectedFile)
                }
            }

            self.selectedFiles.append(contentsOf: results)
            self.isLoading = false
            return results
        } catch {
            self.lastError = error.localizedDescription
            self.isLoading = false
            throw error
        }
    }

    // MARK: - Procesamiento de Documentos (UIDocumentPicker)

    public func processDocumentURLs(_ urls: [URL]) async throws -> [SelectedFile] {
        isLoading = true
        lastError = nil
        var results: [SelectedFile] = []

        do {
            for url in urls {
                let isSecurityScoped = url.startAccessingSecurityScopedResource()
                defer {
                    if isSecurityScoped {
                        url.stopAccessingSecurityScopedResource()
                    }
                }

                let data = try Data(contentsOf: url)
                let originalName = url.lastPathComponent
                let uniqueTargetName = "\(UUID().uuidString.prefix(8))_\(originalName)"
                let targetURL = FileManager.default.temporaryDirectory.appendingPathComponent(uniqueTargetName)

                try data.write(to: targetURL, options: .atomic)

                let pathExt = url.pathExtension
                let utType = UTType(filenameExtension: pathExt) ?? .data
                let mimeType = utType.preferredMIMEType ?? "application/octet-stream"

                let selectedFile = SelectedFile(
                    url: targetURL,
                    name: originalName,
                    sizeInBytes: Int64(data.count),
                    mimeType: mimeType,
                    contentType: utType
                )
                results.append(selectedFile)
            }

            self.selectedFiles.append(contentsOf: results)
            self.isLoading = false
            return results
        } catch {
            self.lastError = error.localizedDescription
            self.isLoading = false
            throw error
        }
    }

    // MARK: - Operaciones sobre la Colección

    public func removeFile(withId id: UUID) {
        if let file = selectedFiles.first(where: { $0.id == id }) {
            try? FileManager.default.removeItem(at: file.url)
        }
        selectedFiles.removeAll(where: { $0.id == id })
    }

    public func clearSelectedFiles() {
        for file in selectedFiles {
            try? FileManager.default.removeItem(at: file.url)
        }
        selectedFiles.removeAll()
    }
}
