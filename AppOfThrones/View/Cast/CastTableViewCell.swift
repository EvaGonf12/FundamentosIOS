//
//  CastTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var name: UILabel!
    
    // MARK: - DATA
    private var cast: Cast?
    var delegate: FavoriteDelegate?
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatar.layer.cornerRadius = 2.0
        self.avatar.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.avatar.layer.borderWidth = 1.0
    }
    
    // MARK: - SETUP
    
    func setCast(_ cast: Cast) {
        self.cast = cast
        
        let heartImagedNamed = DataController.shared.isFavorite(cast) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImagedNamed)
        self.heart.setImage(heartImage, for: .normal)
        
        self.episodes.text = "\(cast.episodes ?? 0) episodes"
        self.role.text = cast.role
        self.name.text = cast.fullname
        self.avatar.image = UIImage.init(named: cast.fullname ?? "")
    }
    
    @IBAction func favoriteAction(_ sender: Any){
        if let castAux = self.cast {
            if DataController.shared.isFavorite(castAux) == true {
                DataController.shared.removeFavorite(castAux)
            } else {
                DataController.shared.addFavorite(castAux)
            }
            self.delegate?.didFavoriteChanged()
        }
        let heartImagedNamed = DataController.shared.isFavorite(self.cast!) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImagedNamed)
        self.heart.setImage(heartImage, for: .normal)
    }
}
