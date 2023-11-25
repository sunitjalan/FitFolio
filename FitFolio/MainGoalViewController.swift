//
//  MainGoalViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import UIKit
import RealmSwift

class MainGoalViewController: UIViewController {
    var registrationData = RegistrationData()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        FitnessImage.addGestureRecognizer(tapGesture1)

        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        BeActiveImage.addGestureRecognizer(tapGesture2)

        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        HealthImage.addGestureRecognizer(tapGesture3)

        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        BalanceImage.addGestureRecognizer(tapGesture4)

                // Enable user interaction for image views
        FitnessImage.isUserInteractionEnabled = true
        BeActiveImage.isUserInteractionEnabled = true
        BalanceImage.isUserInteractionEnabled = true
        HealthImage.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var FitnessImage: UIImageView!
    @IBOutlet weak var BeActiveImage: UIImageView!
    @IBOutlet weak var BalanceImage: UIImageView!
    @IBOutlet weak var HealthImage: UIImageView!
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
            // Handle tap on image view
        if let tappedImageView = sender.view as? UIImageView {
                // Set main goal based on the tapped image view
        switch tappedImageView {
            case FitnessImage:
                    registrationData.mainGoal = "Fitness"
            case BeActiveImage:
                    registrationData.mainGoal = "BeActive"
            case BalanceImage:
                    registrationData.mainGoal = "Balance"
            case HealthImage:
                    registrationData.mainGoal = "Health"
            default:
                break
            }
        }

            // Optionally, you can update the UI to highlight the selected image view
            updateSelectedImageView(sender.view as? UIImageView)
    }
    
    func updateSelectedImageView(_ selectedImageView: UIImageView?) {
        // Reset border color for all image views
        FitnessImage.layer.borderColor = UIColor.clear.cgColor
        BeActiveImage.layer.borderColor = UIColor.clear.cgColor
        BalanceImage.layer.borderColor = UIColor.clear.cgColor
        HealthImage.layer.borderColor = UIColor.clear.cgColor

        // Highlight the selected image view by changing the border color
        selectedImageView?.layer.borderWidth = 2.0
        selectedImageView?.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        //performSegue(withIdentifier: "toCreateAccountSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateAccountSegue" {
        if let destinationVC = segue.destination as? CreateAccountViewController {
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
