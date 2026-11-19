//
//  Map.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/19/26.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
