//
//  House.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 18/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

class House: Equatable, CustomStringConvertible, Codable {

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


extension House  {
    var description: String {
        let value = "HOUSE ITEM\n" +
                    "Name: \(self.name ?? "nil")\n" +
                    "Image: \(self.imageName ?? "nil")\n" +
                    "Words: \(self.words ?? "nil")\n" +
                    "Seat: \(self.seat ?? "nil")"
        return value
    }
    
    static func == (_ lhs: House, _ rhs: House) -> Bool {
        return
            lhs.imageName == rhs.imageName &&
            lhs.name == rhs.name &&
            lhs.words == rhs.words &&
            lhs.seat == rhs.seat
    }
}
