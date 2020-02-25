//
//  EpisodeDetailsTableViewImageCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeDetailsTableViewImageCell: UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var episodeDetailsImage: UIImageView!
    
    // MARK: - DATA
    private var imageName: String?
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - SETUP
    func setImage(_ imageName : String) {
        self.imageName = imageName
        if let image = self.imageName {
            self.episodeDetailsImage.image = UIImage.init(named: image)
        }
    }
    
}
