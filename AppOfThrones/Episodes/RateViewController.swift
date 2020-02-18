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
    
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    
    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rateLabel.textColor = UIColor.red
        self.rateButton.layer.cornerRadius = 4
    }
    
    // MARK: - IBActions
    
    @IBAction func sliderFire(_ sender: Any) {
        let valueDouble = Double(rateSlider.value)
        self.setRating(valueDouble)
    }
    
    
    @IBAction func confirm(_ sender: Any) {
        let rating = Rating.init(id: 54, rate: .rated(value: 8))
        DataController.shared.rateEpisode(episode, value: 8)
        DataController.shared.removeRateEpisode(episode)
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Rating
    
    func setRating(_ rating: Double) {
        let rate = Double(Int(rateSlider.value * 5) / 5)
        rateLabel.text = String(rate)
        self.setStarImage(star01, rating: rating, position: 0)
        self.setStarImage(star02, rating: rating, position: 1)
        self.setStarImage(star03, rating: rating, position: 2)
        self.setStarImage(star04, rating: rating, position: 3)
        self.setStarImage(star05, rating: rating, position: 4)
    }
    
    func setStarImage(_ imageView: UIImageView, rating: Double, position: Int) {
        let positionDouble = Double(position * 2)
        if rating >= positionDouble + 1.0 &&
            rating < positionDouble + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= positionDouble {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
    }
}
