//
//  ProfileViewController.swift
//  FitFolio
//
//  Created by Sunit Jalan on 23/11/23.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var mainGoalView: UIView!
    @IBOutlet weak var mainGoalImage: UIImageView!
    @IBOutlet weak var mainGoalLabel: UILabel!
    
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet var easyView: UIView!
    
    @IBOutlet var mediumView: UIView!
    
    @IBOutlet var hardView: UIView!
    
    @IBOutlet var cardViews: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set the delegate for weightTextField and ageTextField
        weightTextField.delegate = self
        ageTextField.delegate = self
        for card in cardViews {
            card.layer.cornerRadius = 10
            card.layer.masksToBounds = true
        }
        loadUserData()
        
        // Add tap gesture recognizer to mainGoalView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mainGoalViewTapped))
        mainGoalView.addGestureRecognizer(tapGesture)
        
    }
    // Function to handle tap on mainGoalView
    @objc func mainGoalViewTapped() {
        showMainGoalOptions()
    }
    
    func showMainGoalOptions() {
        let alertController = UIAlertController(title: "Choose Your Main Goal", message: nil, preferredStyle: .alert)

        // Add checkboxes for main goal options
        let fitnessAction = UIAlertAction(title: "Fitness", style: .default) { _ in
            self.updateMainGoal("Fitness")
        }
        let beActiveAction = UIAlertAction(title: "Be Active", style: .default) { _ in
            self.updateMainGoal("BeActive")
        }
        let healthAction = UIAlertAction(title: "Health", style: .default) { _ in
            self.updateMainGoal("Health")
        }
        let balanceAction = UIAlertAction(title: "Balance", style: .default) { _ in
            self.updateMainGoal("Balance")
        }

        // Add actions to the alert controller
        alertController.addAction(fitnessAction)
        alertController.addAction(beActiveAction)
        alertController.addAction(healthAction)
        alertController.addAction(balanceAction)

        // Present the alert controller
        present(alertController, animated: true, completion: nil)
    }
    // Function to update the database with the selected main goal
    func updateMainGoal(_ mainGoal: String) {
        guard let currentUserEmail = SessionManager.shared.currentUserEmail else {
            print("Current user email not available.")
            return
        }

        do {
            let realm = try Realm()
            try realm.write {
                RegistrationDataObject.userWithEmail(currentUserEmail)?.mainGoal = mainGoal
            }

            // Update UI with the selected main goal
            mainGoalLabel.text = mainGoal
            setMainGoalImage(mainGoal: mainGoal)
        } catch {
            print("Error updating database: \(error)")
        }
    }
    func loadUserData() {
        // Retrieve the current user's email from the session manager
        guard let currentUserEmail = SessionManager.shared.currentUserEmail else {
            print("Current user email not available.")
            return
        }
        
        // Use the email to fetch the user data from Realm
        if let currentUser = RegistrationDataObject.userWithEmail(currentUserEmail) {
            // Update UI with user data
            usernameLabel.text = currentUser.username
            emailLabel.text = currentUser.email
            
            // Check and display "Please enter" if values are not present
            mainGoalLabel.text = currentUser.mainGoal ?? "Please enter"
            
            // Set the initial values for weightTextField and ageTextField
            weightTextField.text = currentUser.weight.map { "\($0)" } ?? ""
            ageTextField.text = currentUser.age.map { "\($0)" } ?? ""
            
            // Set the main goal image based on the user's mainGoal
            setMainGoalImage(mainGoal: currentUser.mainGoal)
        } else {
            // Handle the case where the current user data is not available
            print("Current user data not available.")
        }
    }

    func setMainGoalImage(mainGoal: String?) {
        // Define a mapping between mainGoal values and corresponding image assets
        let goalImageMapping: [String: String] = [
            "Fitness": "Dumbell",     // Replace "fitness_image" with the actual asset name
            "BeActive": "Activity",    // Replace "active_image" with the actual asset name
            "Health": "Health",       // Replace "health_image" with the actual asset name
            "Balance": "Yoga",     // Replace "balance_image" with the actual asset name
            "Please enter": "QuestionMark" // Replace "question_mark_image" with the actual asset name
        ]

        // Set the image based on the mainGoal
        if let imageName = goalImageMapping[mainGoal ?? "Please enter"] {
            mainGoalImage.image = UIImage(named: imageName)
        } else {
            // Handle the case where mainGoal is not in the mapping
            mainGoalImage.image = UIImage(named: "QuestionMark") // Default image
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

    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Update the database when editing ends
        updateDatabase(textField)
    }

    // ...

    // Function to update the database with the new weight and age values
    // Function to update the database with the new weight and age values
    func updateDatabase(_ textField: UITextField) {
        guard let currentUserEmail = SessionManager.shared.currentUserEmail else {
            print("Current user email not available.")
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                if textField == weightTextField {
                    // Update weight in the database
                    RegistrationDataObject.userWithEmail(currentUserEmail)?.weight = Double(weightTextField.text ?? "")
                } else if textField == ageTextField {
                    // Update age in the database
                    RegistrationDataObject.userWithEmail(currentUserEmail)?.age = Int(ageTextField.text ?? "")
                }
            }
        } catch {
            print("Error updating database: \(error)")
        }
    }
}
