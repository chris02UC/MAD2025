//
//  Week4_0013_MADApp.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

@main
struct Week4_0013_MADApp: App {
    @StateObject var accountVM = AccountViewModel()
    @StateObject var storeVM = StoreViewModel()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(accountVM)
                .environmentObject(storeVM)
        }
    }
}
