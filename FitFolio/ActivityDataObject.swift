//
//  ActivityDataObject.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import Foundation
import RealmSwift

class ActivityDataObject: Object {
    @Persisted var registrationData: RegistrationDataObject?
    @Persisted var date: Date?
    @Persisted var steps: Int = 0
    @Persisted var caloriesBurnt: Int = 0
    @Persisted var flightsClimbed: Int = 0
    @Persisted var standingHours: Int = 0
    @Persisted var workoutHours: Int = 0
}

