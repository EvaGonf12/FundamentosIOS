//
//  HousesTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 18/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class HousesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseWords: UILabel!
    @IBOutlet weak var houseSeat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Forma parte del ciclo de vida de una lista
        // Se llama cuando se ha cogido la celda del XIB (NIB)
        self.houseImage.layer.cornerRadius = 2.0
        self.houseImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.houseImage.layer.borderWidth = 1.0
        
    }
    
    func setHouse(_ house: House) {
        self.houseName.text = house.name
        self.houseWords.text = house.words
        self.houseSeat.text = house.seat
        self.houseImage.image = UIImage.init(named: house.imageName ?? "")
    }
}
