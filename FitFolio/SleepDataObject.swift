//
//  SleepDataObject.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import Foundation
import RealmSwift

class SleepDataObject: Object {
    @Persisted var registrationData: RegistrationDataObject?
    @Persisted var date: Date?
    @Persisted var hoursOfSleep: Int?
    @Persisted var sleepQuality: Int?
    @Persisted var deepSleepHours: Double?
    @Persisted var lightSleepHours: Double?
}
