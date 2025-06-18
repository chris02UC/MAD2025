//
//  MoodModel.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import Foundation

enum MoodType: String, Codable, CaseIterable {
    case sad = "Sad"
    case neutral = "Neutral"
    case happy = "Happy"
}

struct MoodEntry: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let mood: MoodType
    let note: String
}
