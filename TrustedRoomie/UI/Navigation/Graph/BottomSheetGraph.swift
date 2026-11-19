//
//  BottomSheetGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import SwiftUI

/// Representa las rutas de BottomSheet modales disponibles en la aplicación.
public enum BottomSheetRoute: Identifiable {
    case logout(userEmail: String = "diego@correo.com", onLogout: (() -> Void)? = nil, onCancel: (() -> Void)? = nil)
    case deleteListing(listingTitle: String = "Cuarto luminoso en la Roma Norte", onDelete: (() -> Void)? = nil, onCancel: (() -> Void)? = nil)
    case notifyPayment(paymentConcept: String = "Renta julio", onNotify: (() -> Void)? = nil)
    case notifyLeave(reason: String = "Cambio de ciudad", onConfirm: (() -> Void)? = nil, onCancel: (() -> Void)? = nil)
    case updateRent(onNotify: ((String, String) -> Void)? = nil)
    case sharedPayment(onAddAndNotify: ((String, String, String) -> Void)? = nil)
    case custom(id: String = UUID().uuidString, showDragHandle: Bool = true, content: AnyView)

    public var id: String {
        switch self {
        case .logout(let email, _, _):
            return "logout_\(email)"
        case .deleteListing(let title, _, _):
            return "deleteListing_\(title)"
        case .notifyPayment(let concept, _):
            return "notifyPayment_\(concept)"
        case .notifyLeave(let reason, _, _):
            return "notifyLeave_\(reason)"
        case .updateRent:
            return "updateRent"
        case .sharedPayment:
            return "sharedPayment"
        case .custom(let id, _, _):
            return "custom_\(id)"
        }
    }
}

/// Modificador de vista que conecta el `activeBottomSheet` del `NavigationRouter` con la presentación de `BaseBottomSheet`.
public struct BottomSheetGraphModifier: ViewModifier {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public func body(content: Content) -> some View {
        content
            .overlay {
                if let router, let route = router.activeBottomSheet {
                    ZStack {
                        switch route {
                        case .logout(let email, let onLogout, let onCancel):
                            BaseBottomSheet(
                                isPresented: Binding(
                                    get: { router.activeBottomSheet != nil },
                                    set: { if !$0 { router.dismissBottomSheet() } }
                                ),
                                showDragHandle: false,
                                onDismissRequest: {
                                    router.dismissBottomSheet()
                                    onCancel?()
                                }
                            ) {
                                LogoutBottomSheetContent(
                                    userEmail: email,
                                    onClose: {
                                        router.dismissBottomSheet()
                                        onCancel?()
                                    },
                                    onCancel: {
                                        router.dismissBottomSheet()
                                        onCancel?()
                                    },
                                    onLogout: {
                                        router.dismissBottomSheet()
                                        onLogout?()
                                    }
                                )
                            }

                        case .deleteListing(let title, let onDelete, let onCancel):
                            BaseBottomSheet(
                                isPresented: Binding(
                                    get: { router.activeBottomSheet != nil },
                                    set: { if !$0 { router.dismissBottomSheet() } }
                                ),
                                showDragHandle: false,
                                onDismissRequest: {
                                    router.dismissBottomSheet()
                                    onCancel?()
                                }
                            ) {
                                DeleteListingBottomSheetContent(
                                    listingTitle: title,
                                    onClose: {
                                        router.dismissBottomSheet()
                                        onCancel?()
                                    },
                                    onCancel: {
                                        router.dismissBottomSheet()
                                        onCancel?()
                                    },
                                    onDelete: {
                                        router.dismissBottomSheet()
                                        onDelete?()
                                    }
                                )
                            }

                        case .notifyPayment(let concept, let onNotify):
                            BaseBottomSheet(
                                isPresented: Binding(
                                    get: { router.activeBottomSheet != nil },
                                    set: { if !$0 { router.dismissBottomSheet() } }
                                ),
                                showDragHandle: false,
                                onDismissRequest: {
                                    router.dismissBottomSheet()
                                }
                            ) {
                                NotifyPaymentBottomSheetContent(
                                    paymentConcept: concept,
                                    onClose: {
                                        router.dismissBottomSheet()
                                    },
                                    onNotify: {
                                        router.dismissBottomSheet()
                                        onNotify?()
                                    }
                                )
                            }

                        case .notifyLeave(let reason, let onConfirm, let onCancel):
                            BaseBottomSheet(
                                isPresented: Binding(
                                    get: { router.activeBottomSheet != nil },
                                    set: { if !$0 { router.dismissBottomSheet() } }
                                ),
                                showDragHandle: false,
                                onDismissRequest: {
                                    router.dismissBottomSheet()
                                    onCancel?()
                                }
                            ) {
                                NotifyLeaveBottomSheetContent(
                                    reason: reason,
                                    onClose: {
                                        router.dismissBottomSheet()
                                        onCancel?()
                                    },
                                    onCancel: {
                                        router.dismissBottomSheet()
                                        onCancel?()
                                    },
                                    onConfirm: {
                                        router.dismissBottomSheet()
                                        onConfirm?()
                                    }
                                )
                            }

                        case .updateRent(let onNotify):
                            BaseBottomSheet(
                                isPresented: Binding(
                                    get: { router.activeBottomSheet != nil },
                                    set: { if !$0 { router.dismissBottomSheet() } }
                                ),
                                showDragHandle: false,
                                onDismissRequest: {
                                    router.dismissBottomSheet()
                                }
                            ) {
                                UpdateRentBottomSheetContent(
                                    onClose: {
                                        router.dismissBottomSheet()
                                    },
                                    onNotify: { newAmount, comment in
                                        router.dismissBottomSheet()
                                        onNotify?(newAmount, comment)
                                    }
                                )
                            }

                        case .sharedPayment(let onAddAndNotify):
                            BaseBottomSheet(
                                isPresented: Binding(
                                    get: { router.activeBottomSheet != nil },
                                    set: { if !$0 { router.dismissBottomSheet() } }
                                ),
                                showDragHandle: false,
                                onDismissRequest: {
                                    router.dismissBottomSheet()
                                }
                            ) {
                                SharedPaymentBottomSheetContent(
                                    onClose: {
                                        router.dismissBottomSheet()
                                    },
                                    onAddAndNotify: { service, amount, dueDate in
                                        router.dismissBottomSheet()
                                        onAddAndNotify?(service, amount, dueDate)
                                    }
                                )
                            }

                        case .custom(_, let showDragHandle, let customView):
                            BaseBottomSheet(
                                isPresented: Binding(
                                    get: { router.activeBottomSheet != nil },
                                    set: { if !$0 { router.dismissBottomSheet() } }
                                ),
                                showDragHandle: showDragHandle,
                                onDismissRequest: {
                                    router.dismissBottomSheet()
                                }
                            ) {
                                customView
                            }
                        }
                    }
                    .ignoresSafeArea()
                    .transition(.identity)
                }
            }
    }
}

public extension View {
    /// Inyecta el soporte de BottomSheets globales al grafo de navegación usando `NavigationRouter`.
    func BottomSheetGraph() -> some View {
        modifier(BottomSheetGraphModifier())
    }
}
