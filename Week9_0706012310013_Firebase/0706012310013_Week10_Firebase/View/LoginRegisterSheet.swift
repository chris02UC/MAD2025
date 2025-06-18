//
//  LoginRegisterSheet.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI

struct LoginRegisterSheet: View {
    @Binding var showAuthSheet: Bool
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var registerClicked = false

    var body: some View {
        VStack {
            Spacer()

            if registerClicked {
                VStack(spacing: 16) {
                    Text("Register")
                               .font(.title)
                               .bold()

                    TextField("Email", text: $authViewModel.myUser.email)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Password", text: $authViewModel.myUser.password)
                        .textFieldStyle(.roundedBorder)

                    if authViewModel.falseCredentials {
                        Text("Registration failed")
                            .foregroundColor(.red)
                    }

                    Button {
                        Task {
                            await authViewModel.signUp()
                            if authViewModel.isSigningIn {
                                showAuthSheet = false
                            }
                        }
                    } label: {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Back to Login") {
                        registerClicked = false
                        authViewModel.falseCredentials = false
                    }
                    .font(.footnote)
                }
                .padding(.horizontal)
            } else {
                VStack(spacing: 16) {
                    Text("Login")
                        .font(.title)
                        .bold()

                    TextField("Email", text: $authViewModel.myUser.email)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Password", text: $authViewModel.myUser.password)
                        .textFieldStyle(.roundedBorder)

                    if authViewModel.falseCredentials {
                        Text("Invalid credentials")
                            .foregroundColor(.red)
                    }

                    Button {
                        Task {
                            await authViewModel.signIn()
                            if authViewModel.isSigningIn {
                                showAuthSheet = false
                            }
                        }
                    } label: {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Don't have an account? Register") {
                        registerClicked = true
                        authViewModel.falseCredentials = false
                    }
                    .font(.footnote)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .interactiveDismissDisabled(true)
    }
}

#Preview {
    LoginRegisterSheet(showAuthSheet: .constant(true))
        .environmentObject(AuthViewModel())
}
