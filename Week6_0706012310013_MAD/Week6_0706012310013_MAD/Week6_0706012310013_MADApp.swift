//
//  Week6_0706012310013_MADApp.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import SwiftUI

@main
struct Week6_0706012310013_MADApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(MoodViewModel())
        }
    }
}
