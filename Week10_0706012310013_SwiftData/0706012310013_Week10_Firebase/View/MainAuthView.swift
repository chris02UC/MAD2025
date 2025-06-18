//
//  MainAuthView.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI

struct MainAuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showAuthSheet = false

    var body: some View {
        NavigationView {
            if authViewModel.isSigningIn {
                MainView()
                    .onAppear {
                        showAuthSheet = false
                    }
            } else {
                Color.clear
                    .onAppear { showAuthSheet = true }
                    .sheet(isPresented: $showAuthSheet) {
                        LoginRegisterSheet(showAuthSheet: $showAuthSheet)
                    }
            }
        }
    }
}

#Preview {
    MainAuthView()
        .environmentObject(AuthViewModel())
}
