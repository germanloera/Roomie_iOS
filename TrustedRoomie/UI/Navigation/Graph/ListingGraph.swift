//
//  ListingGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

public enum ListingRoute: Hashable, Identifiable {
    case ListingDetail(title: String = "")
    case ListingPublish(title: String = "")
    case ManageListing(title: String = "")
   // case Messages(title: String = "")

    public var id: String {
        switch self {
        case .ListingDetail:
            return "ListingDetail"
        case .ListingPublish:
            return "ListingPublish"
        case .ManageListing:
            return "ManageListing"
     //   case .Messages:
       //     return "Messages"
        }
    }
}

extension View {
    func ListingGraph() -> some View {
        navigationDestination(for: ListingRoute.self) { route in
            switch route {
            case .ListingDetail:
                ListingDetailScreen().screenSetup(config: ScreenConfig())
            case .ListingPublish:
                ListingCreateEditScreen().bg()
            case .ManageListing:
                ManageListingScreen().bg()
            }
        }
    }
}
