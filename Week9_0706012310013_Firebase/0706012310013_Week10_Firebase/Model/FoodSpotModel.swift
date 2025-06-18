//
//  FoodSpotModel.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import Foundation

struct FoodSpotModel: Identifiable, Codable, Hashable {
    let id: String
    var userId: String
    var name: String
    var location: String
    var description: String
    var category: String
    var visited: Bool
    var rating: Int?
}
