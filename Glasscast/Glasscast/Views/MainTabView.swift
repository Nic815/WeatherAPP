//
//  MainTabView.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "cloud.sun") }

            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
        .glassEffect()
    }
}
