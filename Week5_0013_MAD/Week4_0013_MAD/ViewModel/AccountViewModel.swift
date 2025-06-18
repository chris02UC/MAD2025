//
//  AccountViewModel.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import Foundation

class AccountViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var loggedInUser: UserModel?
    @Published var isLoggedIn: Bool = false
    @Published var loginErrorMessage: String = ""
    
    func createAccount(username: String, password: String) -> Bool {
        guard !username.isEmpty, !password.isEmpty else {
            return false
        }
        
        let newUser = UserModel(username: username, password: password)
        users.append(newUser)
        
        print("Account created: \(username)")
        return true
    }
    
    func login(username: String, password: String) -> Bool {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            loggedInUser = user
            loginErrorMessage = ""
            isLoggedIn = true
            print("Login successful for: \(username)")
            return true
        } else {
            loginErrorMessage = "Invalid username or password."
            print("Login failed for: \(username)")
            return false
        }
    }
    
    // ✅ Update Username & Password
    func updateUserProfile(newUsername: String, newPassword: String, storeVM: StoreViewModel) {
        guard var user = loggedInUser else { return }
        
        let oldUsername = user.username
        user.username = newUsername
        user.password = newPassword
        loggedInUser = user
        
        // ✅ Update the user in the users array too
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index] = user
        }
        
        // Update username in Store Items & Purchased Items
        storeVM.updateSellerName(oldUsername: oldUsername, newUsername: newUsername)
        
        print("Profile updated for \(newUsername)")
    }
    
    // ✅ Delete User & Remove Unsold Items
    func deleteAccount(storeVM: StoreViewModel) {
        guard let user = loggedInUser else { return }

        // Remove unsold items from the store
        storeVM.removeUnsoldItems(bySeller: user.username)

        // Remove user from the system
        users.removeAll { $0.username == user.username }
        loggedInUser = nil

        isLoggedIn = false
        print("Account deleted for \(user.username)")
    }
}
