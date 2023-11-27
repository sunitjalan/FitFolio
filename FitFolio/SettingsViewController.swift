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
            showChangePasswordAlert()
        }

        private func showChangePasswordAlert() {
            let alertController = UIAlertController(title: "Change Password", message: nil, preferredStyle: .alert)

            alertController.addTextField { textField in
                textField.placeholder = "Enter Username"
            }
            alertController.addTextField { textField in
                textField.placeholder = "Enter Current Password"
                textField.isSecureTextEntry = true
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let validateAction = UIAlertAction(title: "Validate", style: .default) { _ in
                guard let username = alertController.textFields?[0].text,
                      let currentPassword = alertController.textFields?[1].text else {
                    return
                }

                // Validate the entered username and password
                if self.validateCredentials(username: username, password: currentPassword) {
                    self.showChangePasswordConfirmationAlert(username: username)
                } else {
                    self.showInvalidPasswordAlert()
                }
            }

            alertController.addAction(cancelAction)
            alertController.addAction(validateAction)

            present(alertController, animated: true, completion: nil)
        }

        private func validateCredentials(username: String, password: String) -> Bool {
//            do {
//                let realm = try Realm()
//                let user = realm.objects(RegistrationDataObject.self)
//                    .filter("username == %@ AND password == %@", username, password)
//                    .first
//                return user != nil
//            } catch {
//                print("Error querying Realm: \(error)")
//                return false
//            }
            return true
        }

        private func showChangePasswordConfirmationAlert(username: String) {
            let alertController = UIAlertController(title: "Change Password", message: "Enter New Password", preferredStyle: .alert)

            alertController.addTextField { textField in
                textField.placeholder = "New Password"
                textField.isSecureTextEntry = true
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let updateAction = UIAlertAction(title: "Update", style: .default) { _ in
                guard let newPassword = alertController.textFields?.first?.text else {
                    return
                }

                // Update the password in the database
                self.updatePassword(username: username, newPassword: newPassword)
            }

            alertController.addAction(cancelAction)
            alertController.addAction(updateAction)

            present(alertController, animated: true, completion: nil)
        }

        private func updatePassword(username: String, newPassword: String) {
            do {
                let realm = try Realm()

                if let user = realm.objects(RegistrationDataObject.self).filter("username == %@", username).first {
                    try realm.write {
                        user.password = newPassword
                    }
                    print("Password updated successfully.")
                } else {
                    print("User not found.")
                }

            } catch {
                print("Error updating password in Realm: \(error)")
            }
        }

        private func showInvalidPasswordAlert() {
            let alert = UIAlertController(title: "Invalid Password", message: "Please enter valid username and password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
}
