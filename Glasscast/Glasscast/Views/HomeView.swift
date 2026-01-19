//
//  HomeView.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedCity: FavoriteCity?

    @EnvironmentObject var settings: SettingsStore

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {

                    // Loading State
                    if viewModel.isLoading {
                        ProgressView()
                            .scaleEffect(1.4)
                    }

                    // Error State
                    if let error = viewModel.error {
                        Text(error)
                            .foregroundColor(.red)
                    }

                    // Current Weather
                    if let temp = viewModel.temperature(using: settings.unit) {
                        VStack(spacing: 8) {
                            Text("\(temp, specifier: "%.0f")\(settings.unit.display)")
                                .font(.system(size: 72, weight: .thin))

                            Text(viewModel.condition)
                                .font(.headline)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .glassEffect()
                    }

                    // 5-Day Forecast
                    if !viewModel.forecasts.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(viewModel.forecasts) { forecast in
                                    ForecastCard(forecast: forecast)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding()
            }
            .refreshable {
                await reloadWeather()
            }
            .navigationTitle(selectedCity?.city_name ?? "WeatherAPP")
            .toolbar {

                // Add/Search City
                NavigationLink {
                    CitySearchView { city in
                        selectedCity = FavoriteCity(
                            id: UUID(),
                            city_name: city.name,
                            lat: city.lat,
                            lon: city.lon
                        )

                        Task {
                            await viewModel.loadWeather(
                                lat: city.lat,
                                lon: city.lon
                            )
                        }
                    }
                } label: {
                    Image(systemName: "plus")
                }


                // Favorites
                NavigationLink {
                    FavoritesView { city in
                        selectedCity = city
                        Task {
                            await viewModel.loadWeather(
                                lat: city.lat,
                                lon: city.lon
                            )
                        }
                    }
                } label: {
                    Image(systemName: "star")
                }
            }
        }
        .task {
            await reloadWeather()
        }
        .glassEffect()
    }

    // MARK: - Helper

    private func reloadWeather() async {
        if let city = selectedCity {
            await viewModel.loadWeather(lat: city.lat, lon: city.lon)
        } else {
            // Default city as required (can be any)
            await viewModel.loadWeather(lat: 28.61, lon: 77.20)
        }
    }
}
