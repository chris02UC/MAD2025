//
//  FoodSpotModel.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import Foundation
import SwiftData

@Model
class FoodSpotModel {
  @Attribute(.unique) var id: String = UUID().uuidString
  var userId: String
  var name: String
  var location: String
  var details: String
  var category: String
  var visited: Bool
  var rating: Int?

  init(id: String = UUID().uuidString,
       userId: String,
       name: String,
       location: String,
       details: String,
       category: String,
       visited: Bool,
       rating: Int? = nil)
  {
    self.id = id
    self.userId = userId
    self.name = name
    self.location = location
    self.details = details
    self.category = category
    self.visited = visited
    self.rating = rating
  }
}
