//
//  GlasscastApp.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

@main
struct GlasscastApp: App {

    @StateObject private var authVM = AuthViewModel()
    @StateObject private var settings = SettingsStore()

    var body: some Scene {
        WindowGroup {
            if authVM.isLoggedIn {
                MainTabView()
            } else {
                AuthView()
            }
        }
        .environmentObject(authVM)
        .environmentObject(settings)
    }
}
