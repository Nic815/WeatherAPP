//
//  FavoriteCity.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation

struct FavoriteCity: Identifiable, Codable {
    let id: UUID
    let city_name: String
    let lat: Double
    let lon: Double
}
