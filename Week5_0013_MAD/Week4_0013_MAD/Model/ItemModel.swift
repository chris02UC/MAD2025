//
//  ItemModel.swift
//  Week4_0013_MAD
//
//  Created by student on 20/03/25.
//

import Foundation

struct ItemModel: Identifiable, Hashable {
    let id = UUID()
    let itemName: String
    let itemPrice: Double
    var seller: String
}
