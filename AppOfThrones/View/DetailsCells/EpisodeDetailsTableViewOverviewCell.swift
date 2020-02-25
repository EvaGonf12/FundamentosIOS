//
//  EpisodeDetailsTableViewOverviewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeDetailsTableViewOverviewCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var episodeOverview: UITextView!
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - DATA
    private var overview : String?
    
    // MARK: - SETUP
    func setSeasonOverview(_ overview: String) {
        self.overview = overview
        if let overviewValue = self.overview {
            self.episodeOverview.text = overviewValue
        }
    }
    
}
