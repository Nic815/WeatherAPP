//
//  WeatherService.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation

final class WeatherService {

    static let shared = WeatherService()


    private let apiKey = "129743615315726f6cf1696dabde71f9"

    func fetchWeather(lat: Double, lon: Double) async throws -> WeatherResponse {

        let urlString =
        "https://api.openweathermap.org/data/2.5/forecast" +
        "?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKey)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
