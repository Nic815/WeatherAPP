//
//  WeatherModels.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation

struct WeatherResponse: Codable {
    let list: [WeatherItem]
}

struct WeatherItem: Codable, Identifiable {
    let id = UUID()
    let dt: TimeInterval
    let main: MainWeather
    let weather: [WeatherCondition]
}

struct MainWeather: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct WeatherCondition: Codable {
    let description: String
    let icon: String
}
