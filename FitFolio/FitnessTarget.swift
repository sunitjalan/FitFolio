//
//  FitnessTarget.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import Foundation

enum FitnessTarget {
    case easy
    case medium
    case hard

    var heartRateTarget: (avg: Int, active: Int, resting: Int) {
        switch self {
        case .easy:
            return (80, 90, 60)
        case .medium:
            return (85, 95, 65)
        case .hard:
            return (90, 100, 70)
        }
    }

    var activityTarget: (steps: Int, caloriesBurnt: Double, standingHours: Double, workoutHours: Double) {
        switch self {
        case .easy:
            return (8000, 400.0, 6.0, 1.0)
        case .medium:
            return (10000, 500.0, 7.0, 1.5)
        case .hard:
            return (12000, 600.0, 8.0, 2.0)
        }
    }

    var nutritionTarget: (calories: Int, protein: Double, fiber: Double) {
        switch self {
        case .easy:
            return (2000, 60.0, 25.0)
        case .medium:
            return (2200, 70.0, 30.0)
        case .hard:
            return (2400, 80.0, 35.0)
        }
    }

    var sleepTarget: (hoursOfSleep: Double, sleepQuality: Int) {
        switch self {
        case .easy:
            return (7.0, 3)
        case .medium:
            return (7.5, 4)
        case .hard:
            return (8.0, 5)
        }
    }
}
