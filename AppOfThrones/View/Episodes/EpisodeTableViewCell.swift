//
//  EpisodeTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeTableViewCell : UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    @IBOutlet weak var rate: UIButton!
    @IBOutlet weak var heart: UIButton!
    
    // MARK: - DATA
    private var episode: Episode?
    
    // MARK: - DELEGATES
    var delegate : FavoriteDelegate?

    // MARK: - BLOCKS
    var rateBlock: (() -> Void)?
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        self.thumb.layer.cornerRadius = 2.0
        self.thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.thumb.layer.borderWidth = 1.0
        self.rate.layer.cornerRadius = 15
    }
    
    // MARK: - SETUP
    
    // SET EPISODE
    func setEpisode(_ episode: Episode) {
        self.episode = episode
        
        self.thumb.image = UIImage.init(named: episode.image ?? "")
        self.title.text = episode.name
        self.subtitle.text = episode.date
        
        let heartImagedNamed = DataController.shared.isFavorite(episode) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImagedNamed)
        self.heart.setImage(heartImage, for: .normal)
        
        if let rating = DataController.shared.ratingForEpisode(episode) {
            switch rating.rate {
            case .rated(let value):
                self.setRating(value)
            case .unrated:
                self.modeRate()
            }
        } else {
            self.modeRate()
        }
    }
    
    // MARK: - IBACTIONS
    
    // rate ACTION
    @IBAction func fireRate(_ sender: Any) {
        self.rateBlock?()
    }
    
    // heart ACTION
    @IBAction func heartAction(_ sender: Any) {
        if let episode = self.episode {
            if DataController.shared.isFavorite(episode) == true {
                DataController.shared.removeFavorite(episode)
            } else {
                DataController.shared.addFavorite(episode)
            }
        }
        let heartImagedNamed = DataController.shared.isFavorite(self.episode!) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImagedNamed)
        self.heart.setImage(heartImage, for: .normal)
    }
    
    // MARK: - RATING
    
    // Put cell in mode RATE
    func modeRate() {
        self.rate.isHidden = false
        self.star01.isHidden = true
        self.star02.isHidden = true
        self.star03.isHidden = true
        self.star04.isHidden = true
        self.star05.isHidden = true
    }
    
    // Put cell in mode STAR
    func modeStar() {
        self.rate.isHidden = true
        self.star01.isHidden = false
        self.star02.isHidden = false
        self.star03.isHidden = false
        self.star04.isHidden = false
        self.star05.isHidden = false
    }
    
    // Set Star State
    func setRating(_ rating: Double) {
        self.modeStar()
        self.setStarImage(self.star01, rating: rating, position: 0)
        self.setStarImage(self.star02, rating: rating, position: 1)
        self.setStarImage(self.star03, rating: rating, position: 2)
        self.setStarImage(self.star04, rating: rating, position: 3)
        self.setStarImage(self.star05, rating: rating, position: 4)
    }
    
    // Set Star image
    func setStarImage(_ imageView: UIImageView, rating: Double, position: Int) {
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
