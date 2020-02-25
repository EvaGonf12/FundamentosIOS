//
//  KeyValueTableViewCell.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class KeyValueTableViewCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - DATA
    private var key : String?
    private var value : String?
    
    // MARK: - SETUP
    func setData(withKey key: String, withValue value: String) {
        self.key = key
        self.value = value
        if let keyData = self.key,
            let valueData = self.value {
            self.keyLabel.text = keyData
            self.valueLabel.text = valueData
        }
    }
    
    func setFontText(_ fontSize: Int) {
        self.keyLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        self.valueLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    }
}
