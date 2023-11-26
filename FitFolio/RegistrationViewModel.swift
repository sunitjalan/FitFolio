//
//  RegistrationViewModel.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import Foundation
import RealmSwift

class RegistrationDataObject: Object {
    @Persisted var age: Int?
    @Persisted var gender: String?
    @Persisted var weight: Double?
    @Persisted var mainGoal: String?
    @Persisted var username: String?
    @Persisted var email: String?
    @Persisted var password: String?
    @Persisted var fitnessGoal: String?
    
    override static func primaryKey() -> String? {
            return "email"
    }
    
    static func userWithEmail(_ email: String) -> RegistrationDataObject? {
        do {
            let realm = try Realm()
            return realm.objects(RegistrationDataObject.self)
                .filter("email == %@", email)
                .first
        } catch {
            print("Error querying Realm: \(error)")
            return nil
        }
    }
}

extension RegistrationDataObject {
    var sleepData: LinkingObjects<SleepDataObject> {
        return LinkingObjects(fromType: SleepDataObject.self, property: "registrationData")
    }

    var heartData: LinkingObjects<HeartDataObject> {
        return LinkingObjects(fromType: HeartDataObject.self, property: "registrationData")
    }

    var activityData: LinkingObjects<ActivityDataObject> {
        return LinkingObjects(fromType: ActivityDataObject.self, property: "registrationData")
    }

    var nutritionData: LinkingObjects<NutritionDataObject> {
        return LinkingObjects(fromType: NutritionDataObject.self, property: "registrationData")
    }
}


