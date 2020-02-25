//
//  ImageTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var detailsImage: UIImageView!
    
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
            self.detailsImage.image = UIImage.init(named: image)
        }
    }
    
}
