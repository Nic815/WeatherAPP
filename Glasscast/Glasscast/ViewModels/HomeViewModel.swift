//
//  HomeViewModel.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation
internal import Combine

@MainActor
class HomeViewModel: ObservableObject {

    @Published var currentTemp: Double?
    @Published var condition: String = ""
    @Published var forecasts: [DailyForecast] = []
    @Published var isLoading = false
    @Published var error: String?

    private var rawTemp: Double?

    func loadWeather(lat: Double, lon: Double) async {
        isLoading = true
        error = nil

        do {
            let response = try await WeatherService.shared.fetchWeather(lat: lat, lon: lon)
            process(response)
        } catch {
            self.error = error.localizedDescription
        }

        isLoading = false
    }

    func temperature(using unit: TemperatureUnit) -> Double? {
        guard let rawTemp else { return nil }
        return unit.convert(rawTemp)
    }

    private func process(_ response: WeatherResponse) {
        guard let first = response.list.first else { return }

        rawTemp = first.main.temp
        condition = first.weather.first?.description.capitalized ?? ""

        let grouped = Dictionary(grouping: response.list) {
            Date(timeIntervalSince1970: $0.dt).formatted(.dateTime.weekday())
        }

        forecasts = grouped.prefix(5).map { day, items in
            DailyForecast(
                day: day,
                min: items.map { $0.main.temp_min }.min() ?? 0,
                max: items.map { $0.main.temp_max }.max() ?? 0,
                icon: items.first?.weather.first?.icon ?? "01d"
            )
        }
    }
}
