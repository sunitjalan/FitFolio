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
