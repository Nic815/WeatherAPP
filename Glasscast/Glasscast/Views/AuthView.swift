//
//  AuthView.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

import SwiftUI

struct AuthView: View {

    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {

            // Background
            LinearGradient(
                colors: [.blue.opacity(0.4), .purple.opacity(0.4)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            GlassEffectContainer {
                VStack(spacing: 28) {

                    
                    VStack(spacing: 8) {
                        Text("WeatherAPP")
                            .font(.system(size: 34, weight: .bold))

                    }

        
                    VStack(spacing: 16) {

                        TextField("Email", text: $email)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 14))

                        SecureField("Password", text: $password)
                            .textContentType(.password)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }

                    // Login Button
                    Button {
                        Task {
                            await authVM.signIn(
                                email: email.trimmingCharacters(in: .whitespaces),
                                password: password
                            )
                        }
                    } label: {
                        Text("Login")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .padding(.top, 8)
                }
                .padding(28)
                .frame(maxWidth: 360)
                .glassEffect()
            }
        }
    }
}
