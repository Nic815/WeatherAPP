//
//  CitySearchViewModel.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation
internal import Combine

@MainActor
class CitySearchViewModel: ObservableObject {

    @Published var query = ""
    @Published var results: [City] = []
    @Published var isLoading = false
    @Published var error: String?

    func search() async {
        guard !query.isEmpty else { return }

        isLoading = true
        do {
            results = try await CitySearchService.shared.searchCity(query: query)
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }

    func saveCity(_ city: City) async {
        do {
            try await FavoritesService.shared.addFavorite(city: city)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
