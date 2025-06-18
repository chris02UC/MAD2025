//
//  CreateAccountView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

struct CreateAccountView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAccountCreated = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 0)
                    .padding(.bottom, 90)
                    .padding(.leading)
                Spacer()
            }
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350)
                .padding(.horizontal)
            
            Button(action: {
                isAccountCreated = accountVM.createAccount(username: username, password: password)
                if isAccountCreated {
                    dismiss()
                }
            }) {
                Text("Create Account")
                    .frame(width: 120)
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    CreateAccountView()
        .environmentObject(AccountViewModel())
}
