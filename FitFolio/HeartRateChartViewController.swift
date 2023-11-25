//
//  HeartRateChartViewController.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import UIKit

import SwiftUI

class HeartRateChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupView()
        
        let chartHostingController = UIHostingController(rootView: HeartRate())
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
//    func setupView(){
//        let controller = UIHostingController(rootView: HeartRate())
//        guard let heartRateView = controller.view else {
//            return
//        }
//        
//        view.addSubview(heartRateView)
//        heartRateView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(15)
//            make.trailing.equalToSuperview().inset(15)
//            make.height.equalTo(500)
//        }
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
