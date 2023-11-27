//
//  DataEntryStruct.swift
//  FitFolio
//
//  Created by Deepesh Garg on 27/11/23.
//

import Foundation

struct ActivityData: Codable {
    let data: [ActivityEntry]
}

struct ActivityEntry: Codable {
    let dayOfWeek: String
    let steps: Int
    let caloriesBurnt: Int
    let flightsClimbed: Int
    let standingHours: Int
    let workoutHours: Double
}
