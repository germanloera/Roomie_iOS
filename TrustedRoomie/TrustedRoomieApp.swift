//
//  TrustedRoomieApp.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI
import Orchard

@main struct MyApp: App {
    init() {
        Task {
            await SupabaseProvider.shared.initialize()
        }
        Orchard.loggers.append(ConsoleLogger())
    }

    var body: some Scene {
        WindowGroup {
            NavigationScreen().bg()
        }
    }
}
