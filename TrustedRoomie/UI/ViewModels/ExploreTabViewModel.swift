//
//  ExploreTabViewModel.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/18/26.
//

import Foundation
import SwiftUI
import Observation

@Observable
@MainActor
final class ExploreTabViewModel {
    var activeView: ExplorerView = .map
    
   
    public func setTab(_ view: ExplorerView) {
        activeView = view
    }
    
    
    
}


