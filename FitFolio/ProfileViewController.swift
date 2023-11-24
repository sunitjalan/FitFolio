//
//  ProfileViewController.swift
//  FitFolio
//
//  Created by Sunit Jalan on 23/11/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var cardViews: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for card in cardViews {
            card.layer.cornerRadius = 10
            card.layer.masksToBounds = true
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
