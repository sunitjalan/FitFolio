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
}
