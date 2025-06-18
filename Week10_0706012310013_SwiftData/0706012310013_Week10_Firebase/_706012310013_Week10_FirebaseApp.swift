//
//  _706012310013_Week10_FirebaseApp.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

//
//  _706012310013_Week10_FirebaseApp.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI
import Firebase
import FirebaseAppCheck
import SwiftData    // ← bring in SwiftData

@main
struct _706012310013_Week10_FirebaseApp: App {
    
    // 1) Only keep your Auth VM here
    @StateObject private var authViewModel = AuthViewModel()
    
    init() {
        // 2) Your existing Firebase & AppCheck setup
        FirebaseApp.configure()
        
        #if DEBUG
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            // 3) Inject only the Auth VM
            MainAuthView()
                .environmentObject(authViewModel)
        }
        // 4) Register SwiftData container for your FoodSpotModel
        .modelContainer(for: [ FoodSpotModel.self ])
    }
}

