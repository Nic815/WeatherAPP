//
//  City.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct City: Identifiable {
    let id = UUID()
    let name: String
    let lat: Double
    let lon: Double
}
