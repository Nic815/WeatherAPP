//
//  FavoriteCityInsert.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation

struct FavoriteCityInsert: Encodable {
    let user_id: String
    let city_name: String
    let lat: Double
    let lon: Double
}
