//
//  AuthViewModel.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import Foundation
internal import Combine
import Supabase


@MainActor
class AuthViewModel: ObservableObject {

    @Published var isLoggedIn = false
    @Published var error: String?

    func signIn(email: String, password: String) async {
        do {
            try await SupabaseService.shared.client.auth
                .signIn(
                    email: email,
                    password: password
                )

            isLoggedIn = true
        } catch {
            self.error = error.localizedDescription
        }
    }

    func signOut() async {
        do {
            try await SupabaseService.shared.client.auth.signOut()
            isLoggedIn = false
        } catch {
            self.error = error.localizedDescription
        }
    }
}
