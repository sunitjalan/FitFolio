//
//  CircularProgressView.swift
//  FitFolio
//
//  Created by Sunit Jalan on 27/11/23.
//

import Foundation
import UIKit

class CircularProgressView: UIView {

    private let shapeLayer = CAShapeLayer()

    var progressColor: UIColor = UIColor(hex: "#5CB85C") ?? UIColor.systemBlue {
        didSet {
            shapeLayer.strokeColor = progressColor.cgColor
        }
    }

    var progress: CGFloat = 0.0 {
        didSet {
            updateProgress()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircularLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCircularLayer()
    }

    private func setupCircularLayer() {
        let radius = min(bounds.width, bounds.height) / 2 - 10
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)

        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = progressColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round

        layer.addSublayer(shapeLayer)
    }

    private func updateProgress() {
        shapeLayer.strokeEnd = progress
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}
