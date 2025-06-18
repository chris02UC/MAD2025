//
//  WelcomeView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//


import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                    .frame(height: 230)
                
                NavigationLink(destination: CreateAccountView()) {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("UC Online Store")
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(AccountViewModel())
        .environmentObject(StoreViewModel())
}
