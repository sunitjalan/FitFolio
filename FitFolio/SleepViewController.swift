//
//  SleepViewController.swift
//  FitFolio
//
//  Created by Sunit Jalan on 27/11/23.
//

import UIKit

class SleepViewController: UIViewController {

    @IBOutlet weak var SleepInsightLabel: UILabel!
    @IBOutlet var cardViews: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()

        for card in cardViews {
            card.layer.cornerRadius = 10
            card.layer.masksToBounds = true
        }
        // Do any additional setup after loading the view.
        SleepInsightLabel.text = "Normal Sleep, Low deep sleep, focus on improving sleep environment and habits"
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
