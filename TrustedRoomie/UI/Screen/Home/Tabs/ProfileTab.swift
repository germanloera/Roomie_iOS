//
//  ProfileTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI
import Observation

/// Pestaña de perfil en el TabView principal del Home.
public struct ProfileTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public init() {}

    public var body: some View {
        ProfileEmptyState()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    ProfileTab()
        .environment(NavigationRouter())
}
