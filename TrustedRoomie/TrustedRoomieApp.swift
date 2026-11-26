//
//  TrustedRoomieApp.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI

@main struct MyApp: App {
    init() {
        Task {
            await SupabaseProvider.shared.initialize()
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationScreen().bg()
        }
    }
}
