//
//  MainView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    
    @State private var showPersonalSettings = false
    @State private var showStore = false
    @State private var showPurchasedItems = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Text("Welcome \(accountVM.loggedInUser?.username ?? "Dylan")")
                .font(.title)
                .fontWeight(.bold)
            
            Button(action: {
                showPersonalSettings = true
            }) {
                Text("Personal Settings")
                    .frame(width: 360)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
            .sheet(isPresented: $showPersonalSettings) {
                PersonalSettingsView()
            }
            
            Button(action: {
                showStore = true
            }) {
                Text("Store")
                    .frame(width: 360)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
            .sheet(isPresented: $showStore) {
                StoreView()
            }
            
            Button(action: {
                showPurchasedItems = true
            }) {
                Text("Purchased Items")
                    .frame(width: 360)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
            .sheet(isPresented: $showPurchasedItems) {
                PurchasedItemsView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    let previewVM = AccountViewModel()
    previewVM.loggedInUser = UserModel(username: "Dylan", password: "1234")
    
    return MainView()
        .environmentObject(previewVM)
        .environmentObject(StoreViewModel()) // Needed for StoreView if testing preview
}
