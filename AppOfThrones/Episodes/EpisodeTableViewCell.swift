//
//  EpisodeTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

protocol EpisodeTableViewCellDelegate {
    func didRateChanged()
}

class EpisodeTableViewCell : UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var rate: UIButton!
    
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    
    
    // Clausura sin parámetros de entrada ni de salida
    var rateBlock: (() -> Void)?
    
    override func awakeFromNib() {
        // Forma parte del ciclo de vida de una lista
        // Se llama cuando se ha cogido la celda del XIB (NIB)
        self.thumb.layer.cornerRadius = 2.0
        self.thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.thumb.layer.borderWidth = 1.0
        self.rate.layer.cornerRadius = 15
    }
    
    func setEpisode(_ episode: Episode) {
        self.thumb.image = UIImage.init(named: episode.image ?? "")
        self.title.text = episode.name
        self.subtitle.text = episode.overview
        
        if let rating = DataController.shared.ratingForEpisode(episode) {
            switch rating.rate {
            case .rated(let value):
                print("RATED")
                self.setRating(value)
            case .unrated:
                print("UNRATED")
                self.modeRate()
            }
        } else {
            print("NIL")
            self.modeRate()
        }
    }
    
    @IBAction func fireRate(_ sender: Any) {
        // Quiero que esto provoque un efecto en el ViewController -> CLAUSURAS
        self.rateBlock?()
    }
    
    // MARK: - Rating
    
    func modeRate() {
        self.rate.isHidden = false
        self.star01.isHidden = true
        self.star02.isHidden = true
        self.star03.isHidden = true
        self.star04.isHidden = true
        self.star05.isHidden = true
    }
    
    func modeStar() {
        self.rate.isHidden = true
        self.star01.isHidden = false
        self.star02.isHidden = false
        self.star03.isHidden = false
        self.star04.isHidden = false
        self.star05.isHidden = false
    }
    
    func setRating(_ rating: Double) {
        self.modeStar()
        self.setStarImage(self.star01, rating: rating, position: 0)
        self.setStarImage(self.star02, rating: rating, position: 2)
        self.setStarImage(self.star03, rating: rating, position: 4)
        self.setStarImage(self.star04, rating: rating, position: 6)
        self.setStarImage(self.star05, rating: rating, position: 8)
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
