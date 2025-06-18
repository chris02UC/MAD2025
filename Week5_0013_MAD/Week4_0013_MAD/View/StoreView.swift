//
//  StoreView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

struct StoreView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    @EnvironmentObject var storeVM: StoreViewModel
    
    @State private var itemName: String = ""
    @State private var itemPrice: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Post Item section
            Text("Post an Item:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("Item Name", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Price", text: $itemPrice)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                guard let price = Double(itemPrice),
                      !itemName.isEmpty,
                      let seller = accountVM.loggedInUser?.username else { return }
                
                storeVM.postItem(name: itemName, price: price, seller: seller)
                
                itemName = ""
                itemPrice = ""
                
            }) {
                Text("Post Item")
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
            }
            
            Divider()
            
            // Available Items section
            Text("Available Items:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 20)
            
            ScrollView {
                            VStack(spacing: 10) {
                                ForEach(storeVM.availableItems) { item in
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(item.itemName)
                                                .font(.headline)
                                            Text("Seller: \(item.seller)")
                                            Text("$\(String(format: "%.2f", item.itemPrice))")
                                        }
                                        
                                        Spacer()
                                        
                                        // Show/hide Buy button but keep layout consistent
                                        if item.seller != accountVM.loggedInUser?.username {
                                            Button(action: {
                                                if var loggedInUser = accountVM.loggedInUser {
                                                    // ✅ Pass accountVM so purchasedItems are saved in users[]
                                                    storeVM.purchaseItem(item: item, buyer: &loggedInUser, accountVM: accountVM)
                                                    
                                                    // ✅ Update the loggedInUser in accountVM
                                                    accountVM.loggedInUser = loggedInUser
                                                }
                                            }) {
                                                Text("Buy")
                                                    .frame(width: 40, height: 30)
                                                    .padding(5)
                                                    .background(Color.blue)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                            }
                                        } else {
                                            Color.clear
                                                .frame(width: 80, height: 34) // Same size as button
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity) // Make box stretch fully
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 0)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
            }

#Preview {
//    StoreView()
//        .environmentObject(AccountViewModel())
    let previewVM = AccountViewModel()
    
    // Mock user
    previewVM.loggedInUser = UserModel(username: "Dylan", password: "1234")
    
    // Mock store
    let storeVM = StoreViewModel()
    storeVM.availableItems = [
        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
        ItemModel(itemName: "Kursi", itemPrice: 80, seller: "Dylan"),
        ItemModel(itemName: "Meja Mahal", itemPrice: 200, seller: "SomeoneElse")
    ]
    
    return StoreView()
        .environmentObject(previewVM)
        .environmentObject(storeVM)
}
