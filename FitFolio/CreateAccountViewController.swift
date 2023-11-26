//
//  CreateAccountViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import UIKit
import RealmSwift

class CreateAccountViewController: UIViewController {
    var registrationData = RegistrationData()
    
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                print("Documents Directory: \(documentsDirectory)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegisterButtonTapped(_ sender: Any) {
        
        registrationData.username = UsernameTextField.text
        registrationData.email = EmailTextField.text
        registrationData.password = PasswordTextField.text
        registrationData.fitnessGoal = "Easy"
                // Store data in Realm
        storeDataInRealm()
        guard let registrationDataObject = RegistrationDataObject.userWithEmail(registrationData.email!) else {
                print("Error fetching RegistrationDataObject from Realm")
                return
            }

            // Generate dummy data using the RegistrationDataObject
        generateDummyData(registrationDataObject: registrationDataObject)
    }
    
    func storeDataInRealm() {
        do {
            let realm = try Realm()
            try realm.write {
                let registrationDataObject = RegistrationDataObject()
                registrationDataObject.age = registrationData.age
                registrationDataObject.gender = registrationData.gender
                registrationDataObject.weight = registrationData.weight
                registrationDataObject.mainGoal = registrationData.mainGoal
                registrationDataObject.username = registrationData.username
                registrationDataObject.email = registrationData.email
                registrationDataObject.password = registrationData.password
                registrationDataObject.fitnessGoal = registrationData.fitnessGoal

                realm.add(registrationDataObject)
                
                let realmConfiguration = Realm.Configuration.defaultConfiguration
                print("Realm Configuration Path: \(realmConfiguration.fileURL?.absoluteString ?? "Not available")")

            }
        } catch {
            print("Error storing data in Realm: \(error)")
        }
    }
    
    func generateDummyData(registrationDataObject: RegistrationDataObject) {
        generateDummySleepData(registrationData: registrationDataObject)
        generateDummyHeartData(registrationData: registrationDataObject)
        generateDummyActivityData(registrationData: registrationDataObject)
        generateDummyNutritionData(registrationData: registrationDataObject)
    }
    
    func generateDummyActivityData(registrationData: RegistrationDataObject) {
        do {
            let realm = try Realm()
            try realm.write {
                for day in 1...7 {
                    let activityData = ActivityDataObject()
                    activityData.registrationData = registrationData
                    activityData.date = Calendar.current.date(byAdding: .day, value: -day, to: Date())
                    activityData.steps = Int.random(in: 3000...15000)
                    activityData.caloriesBurnt = Int.random(in: 200...800)
                    activityData.flightsClimbed = Int.random(in: 1...10)
                    activityData.standingHours = Int.random(in: 2...12)
                    activityData.workoutHours = Int.random(in: 0...5)

                    realm.add(activityData)
                }
            }
        } catch {
            print("Error generating dummy activity data: \(error)")
        }
    }
    
    func generateDummyNutritionData(registrationData: RegistrationDataObject) {
        do {
            let realm = try Realm()
            try realm.write {
                for day in 1...7 {
                    let nutritionData = NutritionDataObject()
                    nutritionData.registrationData = registrationData
                    nutritionData.date = Calendar.current.date(byAdding: .day, value: -day, to: Date())
                    nutritionData.caloriesIntake = Int.random(in: 1500...3000)
                    nutritionData.dietaryFatTotal = Double.random(in: 30.0...100.0)
                    nutritionData.dietaryFatSaturated = Double.random(in: 10.0...30.0)
                    nutritionData.dietaryCholesterol = Double.random(in: 50...200)
                    nutritionData.dietaryCarbohydrates = Double.random(in: 150.0...300.0)
                    nutritionData.dietaryFiber = Double.random(in: 20.0...50.0)
                    nutritionData.dietarySugar = Double.random(in: 20.0...60.0)
                    nutritionData.dietaryProtein = Double.random(in: 60.0...150.0)
                    nutritionData.dietaryCalcium = Double.random(in: 800.0...1500.0)
                    nutritionData.dietaryIron = Double.random(in: 10.0...20.0)
                    nutritionData.dietaryPotassium = Double.random(in: 2000.0...4000.0)
                    nutritionData.dietarySodium = Double.random(in: 1500...3000)
                    nutritionData.dietaryVitaminA = Double.random(in: 800.0...1500.0)
                    nutritionData.dietaryVitaminC = Double.random(in: 60.0...150.0)
                    nutritionData.dietaryVitaminD = Double.random(in: 20.0...50.0)

                    realm.add(nutritionData)
                }
            }
        } catch {
            print("Error generating dummy nutrition data: \(error)")
        }
    }
    
    func generateDummyHeartData(registrationData: RegistrationDataObject) {
        do {
            let realm = try Realm()
            try realm.write {
                for day in 1...7 {
                    let heartData = HeartDataObject()
                    heartData.registrationData = registrationData
                    heartData.date = Calendar.current.date(byAdding: .day, value: -day, to: Date())
                    heartData.avgHeartRate = Int.random(in: 60...100)
                    heartData.activeHeartRate = Int.random(in: 70...120)
                    heartData.restingHeartRate = Int.random(in: 50...80)

                    realm.add(heartData)
                }
            }
        } catch {
            print("Error generating dummy heart data: \(error)")
        }
    }
    
    func generateDummySleepData(registrationData: RegistrationDataObject) {
        do {
            let realm = try Realm()
            try realm.write {
                for day in 1...7 {
                    let sleepData = SleepDataObject()
                    sleepData.registrationData = registrationData
                    sleepData.date = Calendar.current.date(byAdding: .day, value: -day, to: Date())
                    sleepData.hoursOfSleep = Int.random(in: 4...10)
                    sleepData.sleepQuality = Int.random(in: 1...5)
                    sleepData.deepSleepHours = Double.random(in: 1.0...4.0)
                    sleepData.lightSleepHours = Double.random(in: 3.0...6.0)

                    realm.add(sleepData)
                }
            }
        } catch {
            print("Error generating dummy sleep data: \(error)")
        }
    }



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
