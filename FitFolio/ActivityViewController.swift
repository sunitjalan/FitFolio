//
//  ActivityViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import UIKit

extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityDataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let currentUserEmail = SessionManager.shared.currentUserEmail else {
                print("Current user email not available.")
                return
        }

//            // Fetch activity data for the current user
//        if let activityData = RealmManager.getActivityData(forEmail: currentUserEmail) {
//                // Process activity data
//            var activityDataString = "Activity Data:\n"
//            for entry in activityData {
//                activityDataString += "\(entry.date ?? Date()): Steps: \(entry.steps), Calories Burnt: \(entry.caloriesBurnt)\n"
//                // Add other activity data as needed
//            }
//
//            
//        // Update the label with activity data
//            
//            print("\(activityDataString)")
//        activityDataLabel.text = activityDataString
//        } else {
//                // No activity data found for the user
//        activityDataLabel.text = "No activity data found for the user."
//        }
        
        activityDataLabel.text = "'least_active_days': 'The least active days are typically on Wednesday.', 'least_workout_days': 'The days with the lowest workout hours are typically on Monday.', 'most_active_days': 'The most active days are typically on Friday.', 'most_workout_days': 'The days with the highest workout hours are typically on Friday.'"
        
        // Fetch activity data for the current user
        if let activityData = RealmManager.getActivityData(forEmail: currentUserEmail) {
                // Process activity data
                let activityEntries = Array(activityData.map { entry -> ActivityEntry in
                    // Convert Realm object to Codable struct
                    return ActivityEntry(
                        dayOfWeek: entry.date?.dayOfWeek() ?? "",
                        steps: entry.steps,
                        caloriesBurnt: entry.caloriesBurnt,
                        flightsClimbed: entry.flightsClimbed,
                        standingHours: entry.standingHours,
                        workoutHours: Double(entry.workoutHours)
                    )
                })

                    // Convert to JSON
        do {
            let jsonData = try JSONEncoder().encode(ActivityData(data: activityEntries))
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("Activity Data JSON: \(jsonString)")
                            // Update the label with the JSON string or make API call here
                            //activityDataLabel.text = jsonString

                            // Uncomment the following line to make an API call
                            //try await makeApiCall(with: jsonData)
//                Task {
//                    do {
//                        try await makeApiCall(with: jsonData)
//                    } catch {
//                        print("Error making API call: \(error)")
//                    }
//                }
            }
        } catch {
                print("Error encoding JSON: \(error)")
                }
            } else {
                // No activity data found for the user
                //activityDataLabel.text = "No activity data found for the user."
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
    
    private func makeApiCall(with jsonData: Data) async {
        let urlString = "http://127.0.0.1:8000/activity"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let (data, _) = try await URLSession.shared.data(from: url) // Use 'url' instead of 'request'
            print("Response Data: \(String(data: data, encoding: .utf8) ?? "N/A")")
            print("Response Data: \(String(data: data, encoding: .utf8) ?? "N/A")")
            
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            // Check if "inference" key is present
            if let inference = jsonResponse?["inference"] as? [String: String] {
                // Accessing individual strings from the inference dictionary
                if let leastActiveDays = inference["least_active_days"],
                   let leastWorkoutDays = inference["least_workout_days"],
                   let mostActiveDays = inference["most_active_days"],
                   let mostWorkoutDays = inference["most_workout_days"] {

                    print("\(leastActiveDays), \(leastWorkoutDays), \(mostActiveDays), \(mostWorkoutDays)")

                    // Now you have the strings, you can use them as needed
                    updateUI(with: (leastActiveDays, leastWorkoutDays, mostActiveDays, mostWorkoutDays))
                }
            } else {
                print("No 'inference' key found in the response.")
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    
    private func updateUI(with days: (String, String, String, String)) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let (leastActiveDays, leastWorkoutDays, mostActiveDays, mostWorkoutDays) = days
            self.activityDataLabel.text = "\(leastActiveDays), \(leastWorkoutDays), \(mostActiveDays), \(mostWorkoutDays)"
            // Update UI or perform further actions with these strings
        }
    }
}
