//
//  SettingsView.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var settings: SettingsStore

    var body: some View {
        ZStack {

            // Background
            LinearGradient(
                colors: [.purple.opacity(0.35), .indigo.opacity(0.35)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    // Header
                    VStack(spacing: 6) {
                        Text("Settings")
                            .font(.system(size: 34, weight: .bold))

                        Text("Customize your experience")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 20)

                    // Temperature Unit Card
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Temperature Unit")
                            .font(.headline)

                        Picker("Unit", selection: $settings.unit) {
                            ForEach(TemperatureUnit.allCases, id: \.self) {
                                Text($0.display)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                    // Sign Out Card
                    Button {
                        Task { await authVM.signOut() }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.backward.circle")
                                .font(.title3)

                            Text("Sign Out")
                                .font(.headline)

                            Spacer()
                        }
                        .foregroundColor(.red)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .padding(.top, 10)

                    Spacer()
                }
                .padding()
            }
        }
        .glassEffect()
    }
}
