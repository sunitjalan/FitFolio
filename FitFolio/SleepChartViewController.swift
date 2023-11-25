//
//  SleepChartViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 26/11/23.
//

import UIKit
import SwiftUI

class SleepChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let chartHostingController = UIHostingController(rootView: SleepChart())
        addChild(chartHostingController)
        chartHostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chartHostingController.view)

        NSLayoutConstraint.activate([
            chartHostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            chartHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chartHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chartHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        chartHostingController.didMove(toParent: self)
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
