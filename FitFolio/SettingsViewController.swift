//
//  SettingsViewController.swift
//  FitFolio
//
//  Created by Sunit Jalan on 27/11/23.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController {

    @IBOutlet var changePasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        print("Change Password button tapped!")
        // Show an alert with text fields for username and current password
        let alertController = UIAlertController(title: "Change Password", message: nil, preferredStyle: .alert)

        alertController.addTextField { (textField) in
            textField.placeholder = "Username"
        }

        alertController.addTextField { (textField) in
            textField.placeholder = "Current Password"
            textField.isSecureTextEntry = true
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self] _ in
            guard let self = self else { return }

            // Validate entered credentials
            guard let username = alertController.textFields?[0].text,
                let currentPassword = alertController.textFields?[1].text,
                self.validateCredentials(username: username, password: currentPassword) else {
                    // Display invalid credentials alert
                    self.showAlert(message: "Invalid username or password. Please try again.")
                    return
            }

            // Show an alert for entering a new password
            self.showNewPasswordAlert(username: username)
        }

        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)

        present(alertController, animated: true, completion: nil)
    }

    private func validateCredentials(username: String, password: String) -> Bool {
        do {
            let realm = try Realm()
            let user = realm.objects(RegistrationDataObject.self)
                .filter("username == %@ AND password == %@", username, password)
                .first
            return user != nil
        } catch {
            print("Error querying Realm: \(error)")
            return false
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func showNewPasswordAlert(username: String) {
        let newPasswordAlert = UIAlertController(title: "New Password", message: nil, preferredStyle: .alert)

        newPasswordAlert.addTextField { (textField) in
            textField.placeholder = "Enter New Password"
            textField.isSecureTextEntry = true
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self] _ in
            guard let self = self,
                let newPassword = newPasswordAlert.textFields?[0].text else {
                    return
            }

            // Update the password in the database
            self.updatePassword(username: username, newPassword: newPassword)
        }

        newPasswordAlert.addAction(cancelAction)
        newPasswordAlert.addAction(submitAction)

        present(newPasswordAlert, animated: true, completion: nil)
    }

    private func updatePassword(username: String, newPassword: String) {
        do {
            let realm = try Realm()
            try realm.write {
                if let user = realm.objects(RegistrationDataObject.self).filter("username == %@", username).first {
                    user.password = newPassword
                }
            }
            showAlert(message: "Password updated successfully!")
        } catch {
            print("Error updating password in Realm: \(error)")
            showAlert(message: "Failed to update password.")
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
