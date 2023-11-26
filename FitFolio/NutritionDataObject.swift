//
//  NutritionDataObject.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import Foundation
import RealmSwift

class NutritionDataObject: Object {
    @Persisted var registrationData: RegistrationDataObject?
    @Persisted var date: Date?
    @Persisted var caloriesIntake: Int?
    @Persisted var dietaryFatTotal: Double?
    @Persisted var dietaryFatSaturated: Double?
    @Persisted var dietaryCholesterol: Double?
    @Persisted var dietaryCarbohydrates: Double?
    @Persisted var dietaryFiber: Double?
    @Persisted var dietarySugar: Double?
    @Persisted var dietaryProtein: Double?
    @Persisted var dietaryCalcium: Double?
    @Persisted var dietaryIron: Double?
    @Persisted var dietaryPotassium: Double?
    @Persisted var dietarySodium: Double?
    @Persisted var dietaryVitaminA: Double?
    @Persisted var dietaryVitaminC: Double?
    @Persisted var dietaryVitaminD: Double?

    // Add other nutrition-related properties as needed
}

