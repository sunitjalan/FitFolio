//
//  MentalHealthViewController.swift
//  FitFolio
//
//  Created by Sunit Jalan on 27/11/23.
//

import UIKit

class MentalHealthViewController: UIViewController {
    @IBOutlet var emotionLabels: [UILabel]!
    
    @IBOutlet var emojiLabels: [UILabel]!
    @IBOutlet var emotionSlider: UISlider!
    
    @IBOutlet var cardViews: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()

        for card in cardViews {
            card.layer.cornerRadius = 10
            card.layer.masksToBounds = true
        }
        
        // Set up slider properties
        emotionSlider.minimumValue = 0
        emotionSlider.maximumValue = 4
        emotionSlider.value = 3 // Initial value, "Normal"

        // Update label appearance based on initial slider value
        updateLabelAppearance()

        // Add slider value changed event
        emotionSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        
        
    
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        // Update label appearance when slider value changes
        updateLabelAppearance()
    }

    func updateLabelAppearance() {
        let sliderValue = Int(emotionSlider.value)

        for (index, label) in emotionLabels.enumerated() {
            // Calculate font size and weight based on slider value
            let isSelected = index == sliderValue
            let fontSize: CGFloat = isSelected ? 18 : 14
            let fontWeight: UIFont.Weight = isSelected ? .bold : .regular

            // Apply the font size and weight to the label
            label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)

            // Apply shadow highlight to emoji labels
            let emojiLabel = emojiLabels[index]
            emojiLabel.layer.shadowOpacity = isSelected ? 0.8 : 0.0
            emojiLabel.layer.shadowColor = UIColor(hex: "#022F40")?.cgColor
            emojiLabel.layer.shadowRadius = 5
            emojiLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
}

// UIColor extension to create color from hex

