//
//  CitySearchView.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct CitySearchView: View {

    @StateObject private var vm = CitySearchViewModel()
    @Environment(\.dismiss) private var dismiss

  
    let onCitySelected: (City) -> Void

 
    private var uniqueResults: [City] {
        var seen = Set<String>()
        return vm.results.filter {
            let key = "\($0.name.lowercased())-\($0.lat)-\($0.lon)"
            return seen.insert(key).inserted
        }
    }

    var body: some View {
        ZStack {

            // Background
            LinearGradient(
                colors: [.cyan.opacity(0.35), .blue.opacity(0.35)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 16) {

                // Search Field
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)

                    TextField("Search city", text: $vm.query)
                        .textInputAutocapitalization(.words)
                        .onSubmit {
                            Task { await vm.search() }
                        }
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)

                // Loading
                if vm.isLoading {
                    ProgressView()
                        .padding()
                }

                // Results
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(uniqueResults) { city in
                            Button {
                                Task {
                                    await vm.saveCity(city)
                                    onCitySelected(city)   
                                    dismiss()             
                                }
                            } label: {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(city.name)
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

                Spacer()
            }
            .navigationTitle("Add City")
        }
        .glassEffect()
    }
}
