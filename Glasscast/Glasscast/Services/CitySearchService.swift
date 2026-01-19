//
//  CitySearchService.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation

final class CitySearchService {

    static let shared = CitySearchService()

    // 🔴 HARD-CODED FOR SIMPLICITY (TEMPORARY)
    private let apiKey = "129743615315726f6cf1696dabde71f9"

    func searchCity(query: String) async throws -> [City] {

        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query

        let urlString =
        "https://api.openweathermap.org/geo/1.0/direct" +
        "?q=\(encodedQuery)&limit=5&appid=\(apiKey)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let results = try JSONDecoder().decode([GeoCity].self, from: data)

        return results.map {
            City(name: $0.name, lat: $0.lat, lon: $0.lon)
        }
    }
}

private struct GeoCity: Codable {
    let name: String
    let lat: Double
    let lon: Double
}
