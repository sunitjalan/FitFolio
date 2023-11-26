//
//  RealmManager.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static func getSleepData(forEmail email: String) -> Results<SleepDataObject>? {
            do {
                let realm = try Realm()
                let user = realm.objects(RegistrationDataObject.self).filter("email == %@", email).first

                if let user = user {
                    let sleepData = realm.objects(SleepDataObject.self).filter("registrationData == %@", user)
                    return sleepData
                } else {
                    print("User not found with email: \(email)")
                    return nil
                }
            } catch {
                print("Error querying Realm: \(error)")
                return nil
            }
        }

    static func getActivityData(forEmail email: String) -> Results<ActivityDataObject>? {
            do {
                let realm = try Realm()
                let user = realm.objects(RegistrationDataObject.self).filter("email == %@", email).first

                if let user = user {
                    let activityData = realm.objects(ActivityDataObject.self).filter("registrationData == %@", user)
                    return activityData
                } else {
                    print("User not found with email: \(email)")
                    return nil
                }
            } catch {
                print("Error querying Realm: \(error)")
                return nil
        }
    }

    static func getNutritionData(forEmail email: String) -> Results<NutritionDataObject>? {
            do {
                let realm = try Realm()
                let user = realm.objects(RegistrationDataObject.self).filter("email == %@", email).first

                if let user = user {
                    let nutritionData = realm.objects(NutritionDataObject.self).filter("registrationData == %@", user)
                    return nutritionData
                } else {
                    print("User not found with email: \(email)")
                    return nil
                }
            } catch {
                print("Error querying Realm: \(error)")
                return nil
        }
    }

    static func getHeartData(forEmail email: String) -> Results<HeartDataObject>? {
            do {
                let realm = try Realm()
                let user = realm.objects(RegistrationDataObject.self).filter("email == %@", email).first

                if let user = user {
                    let heartData = realm.objects(HeartDataObject.self).filter("registrationData == %@", user)
                    return heartData
                } else {
                    print("User not found with email: \(email)")
                    return nil
                }
            } catch {
                print("Error querying Realm: \(error)")
                return nil
        }
    }
    
//    private(set) var localRealm: Realm?
//    
//    init(){
//        openRealm()
//    }
//    
//    func openRealm() {
//        do {
//            let config = Realm.Configuration(schemaVersion: 1)
//            Realm.Configuration.defaultConfiguration = config
//            localRealm = try Realm()
//        } catch {
//            print("Error opening realm \(error)")
//        }
//    }
}
