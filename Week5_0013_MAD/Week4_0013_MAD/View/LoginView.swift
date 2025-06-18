//
//  LoginView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
                .frame(height: 80)
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350)
                .padding(.horizontal)
            
            Button(action: {
                isLoggedIn = accountVM.login(username: username, password: password)
            }) {
                Text("Login")
                    .frame(width: 50)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            if !accountVM.loginErrorMessage.isEmpty {
                Text(accountVM.loginErrorMessage)
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Login")
        .navigationDestination(isPresented: $isLoggedIn) {
            MainView()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AccountViewModel())
}
#Preview {
    LoginView()
        .environmentObject(AccountViewModel())
}
