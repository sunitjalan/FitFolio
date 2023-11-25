//
//  RegistrationViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import UIKit
import RealmSwift
class RegistrationViewController:
    UIViewController {
    var registrationData = RegistrationData()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSelection: UISegmentedControl!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        registrationData.age = Int(ageTextField.text ?? "")
        registrationData.gender = genderSelection.titleForSegment(at: genderSelection.selectedSegmentIndex)
        registrationData.weight = Double(weightTextField.text ?? "")

        //performSegue(withIdentifier: "toMainGoalSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainGoalSegue" {
        if let destinationVC = segue.destination as? MainGoalViewController {
                    destinationVC.registrationData = registrationData
                }
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
