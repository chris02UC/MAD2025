//
//  _706012310013_Week10_FirebaseApp.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI
import Firebase
import FirebaseAppCheck


@main
struct _706012310013_Week10_FirebaseApp: App {

@StateObject private var authViewModel = AuthViewModel()
@StateObject private var foodSpotViewModel = FoodSpotViewModel()

init() {
    FirebaseApp.configure()

    #if DEBUG
    let providerFactory = AppCheckDebugProviderFactory()
    AppCheck.setAppCheckProviderFactory(providerFactory)
    #endif
}

var body: some Scene {
    WindowGroup {
        MainAuthView()
            .environmentObject(authViewModel)
            .environmentObject(foodSpotViewModel)
    }
}
}
