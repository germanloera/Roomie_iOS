//
//  ProfileTab.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import Observation
import SwiftUI

/// Pestaña de perfil en el TabView principal del Home.
public struct ProfileTab: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    @State private var startupViewmodel = StartupViewModel()

    public var id: Int = -1

    public init(id: Int = -1) {
        self.id = id
    }

    public var body: some View {
        Group {
            if startupViewmodel.userRole == .new {
                ProfileEmptyState()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else {
                ProfileScreenContent(id: id)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ProfileTab()
        .environment(NavigationRouter())
}
