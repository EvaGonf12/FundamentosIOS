//
//  EpisodeTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeTableViewCell : UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var rate: UIButton!
    
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
    }
    
    @IBAction func fireRate(_ sender: Any) {
        // Quiero que esto provoque un efecto en el ViewController
    }
    
}
