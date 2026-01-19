//
//  ForecastCard.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct ForecastCard: View {

    let forecast: DailyForecast
    @EnvironmentObject var settings: SettingsStore

    var body: some View {
        VStack(spacing: 8) {

            // Day
            Text(forecast.day)
                .font(.caption)
                .foregroundStyle(.secondary)

            // Weather Icon (simple, no extras)
            Image(systemName: "cloud.sun")
                .font(.title2)

            // Max Temperature
            Text("\(settings.unit.convert(forecast.max), specifier: "%.0f")\(settings.unit.display)")
                .font(.headline)

            // Min Temperature
            Text("\(settings.unit.convert(forecast.min), specifier: "%.0f")\(settings.unit.display)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(width: 90)
        .glassEffect()
    }
}
