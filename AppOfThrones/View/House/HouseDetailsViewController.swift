//
//  HouseDetailsViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 01/03/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class HouseDetailsViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseSeat: UILabel!
    @IBOutlet weak var houseWords: UILabel!

    // MARK: - DATA
    private var house : House?
    
    // MARK: - INIT CONVENIENCE
    convenience init(withHouse house: House) {
        self.init()
        self.house = house
    }
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - SETUP
    func setupUI() {
        
        if let image = self.house?.imageName,
            let name = self.house?.name,
            let seat = self.house?.seat,
            let words = self.house?.words {
            self.houseImage.image = UIImage.init(named: image)
            self.houseName.text = name
            self.houseSeat.text = seat
            self.houseWords.text = words
        }
    }
    
}
