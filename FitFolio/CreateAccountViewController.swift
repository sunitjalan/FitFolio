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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
