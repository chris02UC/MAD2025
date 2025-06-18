//
//  PersonalSettingsView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

struct PersonalSettingsView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @EnvironmentObject var storeVM: StoreViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var showWelcomeView = false
    @State private var newUsername: String = ""
    @State private var newPassword: String = ""
    @State private var showSuccessMessage = false
    @State private var showDeleteConfirmation = false

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
                .frame(height: 120)
            Text("Edit Profile")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            TextField("New Username", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                
            
            SecureField("New Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // ✅ Save Changes Button
            Button(action: {
                if !newUsername.isEmpty && !newPassword.isEmpty {
                    accountVM.updateUserProfile(newUsername: newUsername, newPassword: newPassword, storeVM: storeVM)
                    showSuccessMessage = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        showSuccessMessage = false
                    }
                }
            }) {
                Text("Save Changes")
                    .frame(width: 110)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            // ✅ Delete Account Button
            Button(action: {
                showDeleteConfirmation = true
            }) {
                Text("Delete Account")
                    .frame(width: 120)
                    .padding()
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            if showSuccessMessage {
                Text("Changes Saved!")
                    .foregroundColor(.green)
            }
            Spacer()
        }
        .confirmationDialog("", isPresented: $showDeleteConfirmation, titleVisibility: .hidden) {
            
            Button("Delete", role: .destructive) {
                accountVM.deleteAccount(storeVM: storeVM)
                showWelcomeView = true
            }
            
            Button("Cancel", role: .cancel) {
                // Do nothing
            }
        }
        
        .navigationDestination(isPresented: $showWelcomeView) {
            WelcomeView()
                .environmentObject(accountVM)
                .environmentObject(storeVM)
        }
    }
}

#Preview {
    let previewVM = AccountViewModel()
    let previewStoreVM = StoreViewModel()

    // Mock user
    previewVM.loggedInUser = UserModel(username: "Dylan", password: "1234")

    return PersonalSettingsView()
        .environmentObject(previewVM)
        .environmentObject(previewStoreVM)
}

