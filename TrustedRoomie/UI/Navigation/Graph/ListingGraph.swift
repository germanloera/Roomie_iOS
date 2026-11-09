//
//  ListingGraph.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/9/26.
//

import SwiftUI

public enum ListingRoute: Hashable, Identifiable {
    
    case ListingDetail(title: String = "")
    
    public var id: String {
        switch self {
        case .ListingDetail(title: _):
            return "ListingDetail"
        }
    }
}

extension View {
    
    func ListingGraph() -> some View {
        
        navigationDestination(for: ListingRoute.self){ route in
            switch route {
            case .ListingDetail(_) : ListingDetailScreen().bg()
            }
        }
    }
}
