//
//  FavoritesTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 29/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var favEpisodeSeasonTitle: UILabel!
    @IBOutlet weak var favName: UILabel!
    @IBOutlet weak var favDescription: UILabel!
    
    // MARK: - DATA
    private var episode: Episode?
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        self.favImage.layer.cornerRadius = 2.0
        self.favImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.favImage.layer.borderWidth = 1.0
    }
    
    // MARK: - SETUP
    
    // SET EPISODE
    func setEpisode(_ episode: Episode) {
        self.episode = episode
        self.favImage.image = UIImage.init(named: episode.image ?? "")
        self.favEpisodeSeasonTitle.text = "E\(episode.episode)/T\(episode.season)"
        self.favName.text = episode.name
        self.favDescription.text = episode.overview
    }
}
