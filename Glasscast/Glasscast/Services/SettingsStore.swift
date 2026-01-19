//
//  SettingsStore.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation
internal import Combine

@MainActor
class SettingsStore: ObservableObject {

    @Published var unit: TemperatureUnit {
        didSet {
            UserDefaults.standard.set(unit.rawValue, forKey: "temp_unit")
        }
    }

    init() {
        let saved = UserDefaults.standard.string(forKey: "temp_unit")
        self.unit = TemperatureUnit(rawValue: saved ?? "C") ?? .celsius
    }
}
