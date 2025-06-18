//
//  LoginView.swift
//  Week4_MAD_0013
//
//  Created by student on 13/03/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()

                Text("Login")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Spacer().frame(height: 16)

                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.blue)
                        .frame(width: 24, height: 24)
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                }
                .padding(.horizontal, 35)
                .padding(.vertical, 12)
                .background(Color.white.opacity(0.9))
                .cornerRadius(30)
                .padding(.horizontal, 40)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.blue)
                        .frame(width: 24, height: 24)
                    SecureField("Password", text: $password)
                }
                .padding(.horizontal, 35)
                .padding(.vertical, 12)
                .background(Color.white.opacity(0.9))
                .cornerRadius(30)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)

                Button(action: {
                    handleLogin()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 80)
                
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            CategoryView()
        }
    }
    
    //login simple
    private func handleLogin() {
        if !username.isEmpty && !password.isEmpty {
            isLoggedIn = true
        }
    }
}
#Preview {
    LoginView()
}
