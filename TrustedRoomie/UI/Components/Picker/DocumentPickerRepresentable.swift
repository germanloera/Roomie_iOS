//
//  DocumentPickerRepresentable.swift
//  TrustedRoomie
//
//  Created by Senior iOS Developer on 11/26/26.
//

import SwiftUI
import UniformTypeIdentifiers

/// Puente SwiftUI para `UIDocumentPickerViewController` con soporte multiselección y tipos UTType.
public struct DocumentPickerRepresentable: UIViewControllerRepresentable {
    public let allowedContentTypes: [UTType]
    public let allowsMultipleSelection: Bool
    public let onDocumentsPicked: ([URL]) -> Void
    public let onCancel: (() -> Void)?

    public init(
        allowedContentTypes: [UTType] = [.item],
        allowsMultipleSelection: Bool = true,
        onDocumentsPicked: @escaping ([URL]) -> Void,
        onCancel: (() -> Void)? = nil
    ) {
        self.allowedContentTypes = allowedContentTypes
        self.allowsMultipleSelection = allowsMultipleSelection
        self.onDocumentsPicked = onDocumentsPicked
        self.onCancel = onCancel
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    public func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: allowedContentTypes, asCopy: true)
        picker.allowsMultipleSelection = allowsMultipleSelection
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    public final class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: DocumentPickerRepresentable

        init(parent: DocumentPickerRepresentable) {
            self.parent = parent
        }

        public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.onDocumentsPicked(urls)
        }

        public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.onCancel?()
        }
    }
}
