//
//  ProfileViewController.swift
//  FitFolio
//
//  Created by Sunit Jalan on 23/11/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var moveValue: UILabel!
    @IBOutlet var stepsValue: UILabel!
    @IBOutlet var distanceValue: UILabel!
    @IBOutlet var circleView1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        circleView1.layer.cornerRadius = circleView1.frame.width / 2
        circleView1.layer.masksToBounds = true
        // Do any additional setup after loading the view.
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
