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

    public init() {}

    public var body: some View {
        Group {
            if currentUserType == .unregistered {
                ProfileEmptyState()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else {
                ProfileScreenContent()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ProfileTab()
        .environment(NavigationRouter())
}
