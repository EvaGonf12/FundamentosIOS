//
//  RateViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 11/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

protocol RateViewControllerDelegate {
    func didRateChanged()
}


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
    
    private var episode : Episode?
    
    // MARK: - DELEGATES
    
    var delegate: RateViewControllerDelegate?

    // MARK: - INIT CONVENIENCE
    convenience init(withEpisode episode: Episode) {
        self.init()
        self.episode = episode
        self.title = episode.name
    }

    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rateLabel.textColor = UIColor.red
        self.rateButton.layer.cornerRadius = 4
    }
    
    // MARK: - IBActions
    
    // Movimiento del SLIDER
    @IBAction func sliderFire(_ sender: Any) {
        let valueDouble = Double(rateSlider.value)
        self.setRating(valueDouble)
    }
    
    // Botón ACEPTAR
    @IBAction func confirm(_ sender: Any) {
        let rate = Double(Int(rateSlider.value * 5)/10)
        if let episode = self.episode {
            DataController.shared.rateEpisode(episode, value: rate)
            // Esto se aplica sobre el elemento que se presenta
            self.navigationController?.dismiss(animated: true, completion: nil)
            self.delegate?.didRateChanged()
        }
    }
    
    // BOTÓN CERRAR
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - RATING
    
    // Modificar RATE
    func setRating(_ rating: Double) {
        let rate = Double(Int(rating * 5)/10)
        self.rateLabel.text = String(rate)
        self.setStarImage(self.star01, rating: rating, position: 0)
        self.setStarImage(self.star02, rating: rating, position: 2)
        self.setStarImage(self.star03, rating: rating, position: 4)
        self.setStarImage(self.star04, rating: rating, position: 6)
        self.setStarImage(self.star05, rating: rating, position: 8)
    }
    
    // Modificar IMAGE STAR
    func setStarImage(_ imageView: UIImageView, rating: Double, position: Double) {
        let positionDouble = Double(position * 2)
        if rating >= positionDouble + 1.0 &&
            rating < positionDouble + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= positionDouble + 2.0 {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
    }
}
