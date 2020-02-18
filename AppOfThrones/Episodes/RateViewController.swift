//
//  RateViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 11/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Actions
    
    @IBAction func rateButtonAction(_ sender: UIButton) {
        let valueSlider = rateSlider.value
        print("Aceptando \(valueSlider)")
        UIView.animate(withDuration: 0.5) {
            self.imageView.frame.origin.y = 200
        }
    }
    
    @IBAction func rateSliderAction(_ sender: UISlider) {
        let valueInt = Int(rateSlider.value)
        self.rateLabel.text = "\(valueInt)"
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rateLabel.textColor = UIColor.red
        self.rateButton.layer.cornerRadius = 4
    }
}
