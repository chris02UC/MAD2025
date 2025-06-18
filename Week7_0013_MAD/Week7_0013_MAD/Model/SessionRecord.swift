//
//  SessionRecord.swift
//  Week7_0013_MAD
//
//  Created by student on 10/04/25.
//

import Foundation

struct SessionRecord: Identifiable, Hashable {
    let id = UUID()
    let startTime: Date
    let endTime: Date
    let duration: Int
}
