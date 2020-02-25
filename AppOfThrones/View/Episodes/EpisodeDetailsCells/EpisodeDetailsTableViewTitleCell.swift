
//
//  EpisodeDetailsTableViewTitleCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeDetailsTableViewTitleCell: UITableViewCell {
    
    
    // MARK: - OUTLETS
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeDate: UILabel!
    
    // MARK: - DATA
    private var name: String?
    private var number: Int?
    private var date: String?

    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - SETUP
    func setCell(withName name : String, withEpisodeNumber number : Int, onDate date: String) {
        self.name = name
        self.number = number
        self.date = date
       
        if let nameValue = self.name,
            let numberValue = self.number,
            let dateValue = self.date {
            self.episodeTitle.text = "E\(numberValue) - \"\(nameValue)\""
            self.episodeDate.text = dateValue
        }
    }
}
