//
//  HeartDataObject.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import Foundation
import RealmSwift

class HeartDataObject: Object {
    @Persisted var registrationData: RegistrationDataObject?
    @Persisted var date: Date?
    @Persisted var avgHeartRate: Int?
    @Persisted var activeHeartRate: Int?
    @Persisted var restingHeartRate: Int?
}
