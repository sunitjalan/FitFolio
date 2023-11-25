//
//  LoginViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        
        // Retrieve entered username and password
        guard let enteredEmail = emailTextField.text,
            let enteredPassword = passwordTextField.text else {
            // Handle invalid input
            return
        }

        // Check credentials in Realm
        if validateCredentials(email: enteredEmail, password: enteredPassword) {
            // Successful login, navigate to the main app screen
            performSegue(withIdentifier: "toMainAppSegue", sender: self)
            } else {
            // Display error message for unsuccessful login
            showAlert(message: "Incorrect username or password. Please try again.")
        }
        
    }
    
    // Function to validate credentials in Realm
    private func validateCredentials(email: String, password: String) -> Bool {
        do {
            let realm = try Realm()
            let user = realm.objects(RegistrationDataObject.self)
                .filter("email == %@ AND password == %@", email, password)
                .first
            return user != nil
        } catch {
            print("Error querying Realm: \(error)")
            return false
        }
    }

    // Function to show an alert with a custom message
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Login Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
