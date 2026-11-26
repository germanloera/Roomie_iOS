//
//  FilePickerRepositoryProtocol.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import Foundation
import SwiftUI
import PhotosUI

/// Protocolo que unifica el manejo y persistencia en sesión de fotos y documentos seleccionados.
@MainActor
public protocol FilePickerRepositoryProtocol: AnyObject {
    var selectedFiles: [SelectedFile] { get }
    var isLoading: Bool { get }
    var lastError: String? { get }

    func processPhotosPickerItems(_ items: [PhotosPickerItem]) async throws -> [SelectedFile]
    func processDocumentURLs(_ urls: [URL]) async throws -> [SelectedFile]
    func removeFile(withId id: UUID)
    func clearSelectedFiles()
}
