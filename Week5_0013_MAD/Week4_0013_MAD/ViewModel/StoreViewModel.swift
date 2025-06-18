//
//  StoreViewModel.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import Foundation


class StoreViewModel: ObservableObject {
    @Published var availableItems: [ItemModel] = []
    
    func postItem(name: String, price: Double, seller: String) {
        let newItem = ItemModel(itemName: name, itemPrice: price, seller: seller)
        availableItems.append(newItem)
    }
    
    func purchaseItem(item: ItemModel, buyer: inout UserModel, accountVM: AccountViewModel) {
        // Remove from available items
        availableItems.removeAll { $0.id == item.id }
        
        // Add to user's purchased items
        buyer.purchasedItems.append(item)
        if let index = accountVM.users.firstIndex(where: { $0.id == buyer.id }) {
            accountVM.users[index] = buyer
        }
    }
    
    // ✅ Update Seller Name when user updates profile
    func updateSellerName(oldUsername: String, newUsername: String) {
        for i in availableItems.indices {
            if availableItems[i].seller == oldUsername {
                availableItems[i].seller = newUsername
            }
        }
    }
    
    // ✅ Remove Unsold Items if User Deletes Account
    func removeUnsoldItems(bySeller seller: String) {
        availableItems.removeAll { $0.seller == seller }
    }
}
