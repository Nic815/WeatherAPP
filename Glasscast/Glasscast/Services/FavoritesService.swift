//
//  FavoritesService.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation
import Supabase

class FavoritesService {

    static let shared = FavoritesService()

    func fetchFavorites() async throws -> [FavoriteCity] {
        try await SupabaseService.shared.client
            .from("favorite_cities")
            .select()
            .execute()
            .value
    }

    func addFavorite(city: City) async throws {
        let user = try await SupabaseService.shared.client.auth.session.user

        let payload = FavoriteCityInsert(
            user_id: user.id.uuidString,
            city_name: city.name,
            lat: city.lat,
            lon: city.lon
        )

        try await SupabaseService.shared.client
            .from("favorite_cities")
            .insert(payload)
            .execute()
    }
}
