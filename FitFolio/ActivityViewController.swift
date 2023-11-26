//
//  ActivityViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityDataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let currentUserEmail = SessionManager.shared.currentUserEmail else {
                print("Current user email not available.")
                return
        }

            // Fetch activity data for the current user
        if let activityData = RealmManager.getActivityData(forEmail: currentUserEmail) {
                // Process activity data
            var activityDataString = "Activity Data:\n"
            for entry in activityData {
                activityDataString += "\(entry.date ?? Date()): Steps: \(entry.steps), Calories Burnt: \(entry.caloriesBurnt)\n"
                // Add other activity data as needed
            }

            
        // Update the label with activity data
            
            print("\(activityDataString)")
        activityDataLabel.text = activityDataString
        } else {
                // No activity data found for the user
        activityDataLabel.text = "No activity data found for the user."
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
