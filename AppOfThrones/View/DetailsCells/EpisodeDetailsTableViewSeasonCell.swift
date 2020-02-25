//
//  EpisodeDetailsTableViewSeasonCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeDetailsTableViewSeasonCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var episodeSeason: UILabel!
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - DATA
    private var number : Int?
    
    // MARK: - SETUP
    func setSeasonNumber(_ number: Int) {
        self.number = number
        if let numberValue = self.number {
            self.episodeSeason.text = "Season \(numberValue)"
        }
    }
}
