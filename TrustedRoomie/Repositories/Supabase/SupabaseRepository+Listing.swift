//
//  SupabaseRepository+Listing.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation
import Supabase

public extension SupabaseRepository {
    /// Consulta la tabla `listings` y decodifica a una lista de modelos `Listing`.
    func getAvailableListing() async throws -> [Listing] {
        let client = await provider.awaitClient()
        let listings: [Listing] = try await client
            .from("listings")
            .select()
            .execute()
            .value
        return listings
    }
}
