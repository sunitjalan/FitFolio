//
//  NutrientViewController.swift
//  FitFolio
//
//  Created by Sunit Jalan on 27/11/23.
//

import UIKit

class NutrientViewController: UIViewController {

    @IBOutlet weak var NutritionInsightsLabel: UILabel!
    @IBOutlet var cardViews: [UIView]!
    @IBOutlet var outerView: UIStackView!
    @IBOutlet var circularProgressView: CircularProgressView!
    override func viewDidLoad() {
            super.viewDidLoad()
        NutritionInsightsLabel.text = "Consider making some adjustments to your nutritional habits for improved health. Low in: calories, fiber"
        for card in cardViews {
            card.layer.cornerRadius = 10
            card.layer.masksToBounds = true
        }
            // Set the frame to the bounds of your UIView
            circularProgressView.frame = outerView.bounds

            // Set color and progress as needed
//            circularProgressView.progressColor = UIColor(hex: "#022F40")?.cgColor
            circularProgressView.progress = 0.7

            // Add the circular progress view to your UIView
            outerView.addSubview(circularProgressView)
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
