//
//  Rating.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 18/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
}

struct Rating {
    var id: Int
    var rate: Rate
}
