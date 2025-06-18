//
//  ContentView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WelcomeView()
    }
}

#Preview {
    ContentView()
        .environmentObject(AccountViewModel())
        .environmentObject(StoreViewModel())
}
