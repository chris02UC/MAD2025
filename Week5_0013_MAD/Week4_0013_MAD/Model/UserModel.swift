//
//  UserModel.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import Foundation

struct UserModel: Identifiable, Hashable {
    let id = UUID()
    var username: String
    var password: String
    var purchasedItems: [ItemModel] = []
}
