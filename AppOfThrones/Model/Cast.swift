//
//  Cast.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

struct Cast : Codable, Identifiable {
    var id: Int
    var avatar: String?
    var fullname : String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
}
