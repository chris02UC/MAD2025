//
//  AuthViewModel.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isSigningIn: Bool = false
    @Published var user: User? = nil
    @Published var myUser: MyUser = MyUser()
    @Published var falseCredentials: Bool = false

    init() {
        checkUserSession()
    }

    func checkUserSession() {
        self.user = Auth.auth().currentUser
        self.isSigningIn = (self.user != nil)
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Sign Out Error: \(error.localizedDescription)")
        }
        checkUserSession()
    }

    func signIn() async {
        do {
            _ = try await Auth.auth().signIn(
                withEmail: myUser.email,
                password: myUser.password
            )
            DispatchQueue.main.async {
                self.falseCredentials = false
                self.checkUserSession()
                self.myUser = MyUser()
            }
        } catch {
            DispatchQueue.main.async {
                self.falseCredentials = true
            }
        }
    }

//    func signUp() async {
//        do {
//            _ = try await Auth.auth().createUser(
//                withEmail: myUser.email,
//                password: myUser.password
//            )
//            DispatchQueue.main.async {
//                self.falseCredentials = false
//                self.checkUserSession()
//                self.myUser = MyUser()
//            }
//        } catch {
//            DispatchQueue.main.async {
//                self.falseCredentials = true
//            }
//        }
//    }
    // regis fluke for some reason, now works
    func signUp() async {
        do {
            _ = try await Auth.auth().createUser(
                withEmail: myUser.email,
                password: myUser.password
            )
            DispatchQueue.main.async {
                self.falseCredentials = false
                self.checkUserSession()
                self.myUser = MyUser()  // clear fields
            }
        } catch let error as NSError {
            DispatchQueue.main.async {
                self.falseCredentials = true
                print("🚨 signUp failed [code \(error.code)]: \(error.localizedDescription)")
            }
        }
    }
}
