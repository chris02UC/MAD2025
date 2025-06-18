//
//  PurchasedItemsView.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import SwiftUI

struct PurchasedItemsView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    
    var body: some View {
        VStack {
            if let purchasedItems = accountVM.loggedInUser?.purchasedItems,
               !purchasedItems.isEmpty {
                
                // Top Title
                Text("Purchased Items")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Spacer()
                    .frame(height: 20)
                
                ScrollView {
                    Spacer()
                        .frame(height: 30)
                        VStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(purchasedItems.indices, id: \.self) { index in
                                    let item = purchasedItems[index]
                                               
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(item.itemName)
                                            .font(.headline)
                                        Text("Seller: \(item.seller)")
                                        Text("Price: $\(String(format: "%.2f", item.itemPrice))")
                                    }
                                    .padding()
                                               
                                    if purchasedItems.count > 1 && index < purchasedItems.count - 1 {
                                        Divider()
                                    }

                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        }
                    }
                    .background(Color(.systemGray6))
            } else {
                VStack(spacing: 30) {
                    Text("Purchased Items")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("No items purchased.")
                        .foregroundColor(.gray)
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}
#Preview {
    let previewVM = AccountViewModel()
    
    // Case 1: No purchased items
//    previewVM.loggedInUser = UserModel(username: "Dylan", password: "1234")
    
    // Case 2: Purchased items exist
    previewVM.loggedInUser = UserModel(username: "Dylan", password: "1234", purchasedItems: [
        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan"),
//        ItemModel(itemName: "Meja", itemPrice: 100, seller: "Dylan")
    ])
    
    return PurchasedItemsView()
        .environmentObject(previewVM)
}
