//
//  LabelTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var textCell: UILabel!
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - DATA
    private var textData : String?
    
    // MARK: - SETUP
    func setText(_ text: String) {
        self.textData = text
        if let textValue = self.textData {
            self.textCell.text = textValue
        }
    }
    
    func setTextColor(_ color: UIColor) {
        self.textCell.textColor = color
    }
    
    func setFontText(_ fontSize: Int) {
        self.textCell.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    }
}
