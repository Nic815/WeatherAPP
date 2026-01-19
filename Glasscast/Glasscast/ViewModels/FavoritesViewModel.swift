//
//  FavoritesViewModel.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation
internal import Combine

@MainActor
class FavoritesViewModel: ObservableObject {

    @Published var favorites: [FavoriteCity] = []
    @Published var error: String?

    func loadFavorites() async {
        do {
            favorites = try await FavoritesService.shared.fetchFavorites()
        } catch {
            self.error = error.localizedDescription
        }
    }
}
