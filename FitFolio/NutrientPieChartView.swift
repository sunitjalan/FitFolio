//
//  NutrientPieChartView.swift
//  FitFolio
//
//  Created by Sunit Jalan on 27/11/23.
//

import Foundation
import UIKit

class NutrientPieChartView: UIView {
    
    // Dummy values for each nutrient
    var nutrients: [String: Double] = [
        "Vitamins": 20.0,
        "Carbs": 30.0,
        "Minerals": 15.0,
        "Protein": 25.0,
        "Fibre": 10.0,
        "Fat": 5.0
    ]
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Get the center and radius of the pie chart
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        let radius = min(rect.size.width, rect.size.height) / 2 - 10
        
        // Calculate total value of all nutrients
        let totalValue = nutrients.values.reduce(0, +)
        
        // Start angle for the first nutrient
        var startAngle: CGFloat = -CGFloat.pi / 2
        
        // Loop through each nutrient and draw its portion in the pie chart
        for (nutrient, value) in nutrients {
            let endAngle = startAngle + 2 * CGFloat.pi * CGFloat(value / totalValue)
            
            // Random color for each nutrient
            let randomColor = UIColor(red: CGFloat.random(in: 0.0...1.0),
                                      green: CGFloat.random(in: 0.0...1.0),
                                      blue: CGFloat.random(in: 0.0...1.0),
                                      alpha: 1.0)
            
            // Draw the nutrient portion
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.close()
            
            randomColor.setFill()
            path.fill()
            
            // Update the start angle for the next nutrient
            startAngle = endAngle
        }
    }
}
