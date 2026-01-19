//
//  DailyForecast.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation

struct DailyForecast: Identifiable {
    let id = UUID()
    let day: String
    let min: Double
    let max: Double
    let icon: String
}
