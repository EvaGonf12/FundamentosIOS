//
//  House.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 18/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

class House {
    var imageName : String?
    var name : String?
    var words : String?
    var seat : String?
    
    init(imageName: String?, name: String?, words: String?, seat: String?) {
        self.imageName = imageName
        self.name = name
        self.words = words
        self.seat = seat
    }
}
