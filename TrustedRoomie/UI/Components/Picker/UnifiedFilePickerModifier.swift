//
//  UnifiedFilePickerModifier.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import SwiftUI
import PhotosUI
import UniformTypeIdentifiers

/// Modificador de vista que alterna de forma transparente entre PhotosPicker y DocumentPicker,
/// unificando la salida en una lista estructurada de `SelectedFile`.
public struct UnifiedFilePickerModifier: ViewModifier {
    @Binding public var isPresented: Bool
    public let mode: FilePickerMode
    public let onFilesSelected: ([SelectedFile]) -> Void

    @State private var selectedPhotoItems: [PhotosPickerItem] = []
    @State private var showPhotosPicker: Bool = false
    @State private var showDocumentsPicker: Bool = false
    @State private var isProcessing: Bool = false

    private let repository: FilePickerRepository

    public init(
        isPresented: Binding<Bool>,
        mode: FilePickerMode,
        repository: FilePickerRepository = .shared,
        onFilesSelected: @escaping ([SelectedFile]) -> Void
    ) {
        self._isPresented = isPresented
        self.mode = mode
        self.repository = repository
        self.onFilesSelected = onFilesSelected
    }

    public func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { _, newValue in
                if newValue {
                    triggerPickerForCurrentMode()
                }
            }
            .photosPicker(
                isPresented: $showPhotosPicker,
                selection: $selectedPhotoItems,
                maxSelectionCount: maxPhotosCount,
                matching: .images
            )
            .onChange(of: selectedPhotoItems) { _, newItems in
                guard !newItems.isEmpty else { return }
                processPhotoItems(newItems)
            }
            .sheet(isPresented: $showDocumentsPicker, onDismiss: {
                isPresented = false
            }) {
                DocumentPickerRepresentable(
                    allowedContentTypes: allowedDocumentTypes,
                    allowsMultipleSelection: allowMultipleDocuments,
                    onDocumentsPicked: { urls in
                        processDocumentURLs(urls)
                    },
                    onCancel: {
                        isPresented = false
                    }
                )
            }
    }

    private var maxPhotosCount: Int? {
        if case .photos(let max) = mode {
            return max > 0 ? max : nil
        }
        return nil
    }

    private var allowedDocumentTypes: [UTType] {
        if case .documents(let types, _) = mode {
            return types
        }
        return [.item]
    }

    private var allowMultipleDocuments: Bool {
        if case .documents(_, let allowMultiple) = mode {
            return allowMultiple
        }
        return false
    }

    private func triggerPickerForCurrentMode() {
        switch mode {
        case .photos:
            showPhotosPicker = true
        case .documents:
            showDocumentsPicker = true
        }
    }

    private func processPhotoItems(_ items: [PhotosPickerItem]) {
        isProcessing = true
        Task { @MainActor in
            do {
                let processed = try await repository.processPhotosPickerItems(items)
                selectedPhotoItems.removeAll()
                isPresented = false
                isProcessing = false
                onFilesSelected(processed)
            } catch {
                selectedPhotoItems.removeAll()
                isPresented = false
                isProcessing = false
            }
        }
    }

    private func processDocumentURLs(_ urls: [URL]) {
        isProcessing = true
        Task { @MainActor in
            do {
                let processed = try await repository.processDocumentURLs(urls)
                isPresented = false
                isProcessing = false
                onFilesSelected(processed)
            } catch {
                isPresented = false
                isProcessing = false
            }
        }
    }
}

public extension View {
    /// Presenta el selector unificado de fotos o documentos de acuerdo con la modalidad configurada.
    func unifiedFilePicker(
        isPresented: Binding<Bool>,
        mode: FilePickerMode,
        onFilesSelected: @escaping ([SelectedFile]) -> Void
    ) -> some View {
        self.modifier(
            UnifiedFilePickerModifier(
                isPresented: isPresented,
                mode: mode,
                onFilesSelected: onFilesSelected
            )
        )
    }
}
