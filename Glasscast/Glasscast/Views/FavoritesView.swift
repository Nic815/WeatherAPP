//
//  FavoritesView.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct FavoritesView: View {

    @StateObject private var vm = FavoritesViewModel()
    @Environment(\.dismiss) private var dismiss

    let onSelect: (FavoriteCity) -> Void


    private var uniqueFavorites: [FavoriteCity] {
        var seen = Set<String>()
        return vm.favorites.filter {
            let key = "\($0.city_name.lowercased())-\($0.lat)-\($0.lon)"
            return seen.insert(key).inserted
        }
    }

    var body: some View {
        ZStack {

            // Background
            LinearGradient(
                colors: [.indigo.opacity(0.35), .purple.opacity(0.35)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 14) {

                    // Empty State
                    if uniqueFavorites.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "star")
                                .font(.system(size: 40))
                                .foregroundStyle(.secondary)

                            Text("No favorite cities yet")
                                .font(.headline)

                            Text("Search and add cities to see them here.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .padding(.top, 80)
                    }

                    // Favorites List
                    ForEach(uniqueFavorites) { city in
                        Button {
                            onSelect(city)
                            dismiss()
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(city.city_name)
                                        .font(.headline)

                                    Text("Lat \(city.lat, specifier: "%.2f"), Lon \(city.lon, specifier: "%.2f")")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.secondary)
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
        }
        .task {
            await vm.loadFavorites()
        }
        .glassEffect()
    }
}
