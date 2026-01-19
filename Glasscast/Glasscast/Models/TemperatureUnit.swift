//
//  TemperatureUnit.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation

enum TemperatureUnit: String, CaseIterable {
    case celsius = "C"
    case fahrenheit = "F"

    var display: String {
        "°\(rawValue)"
    }

    func convert(_ temp: Double) -> Double {
        switch self {
        case .celsius:
            return temp
        case .fahrenheit:
            return temp * 9 / 5 + 32
        }
    }
}
