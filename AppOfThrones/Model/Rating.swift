//
//  Rating.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 18/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

enum Rate : CustomStringConvertible, Equatable {
    case unrated
    case rated(value: Double)
}

struct Rating : Equatable, CustomStringConvertible {
    var id: Int
    var rate: Rate
    
    static func == (_ lhs: Rating, _ rhs: Rating) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.rate == rhs.rate
    }
}

extension Rating  {
    
    var description: String {
        let value = "RATING ITEM\n" +
                    "Id: \(self.id)\n" +
                    "Rate: \(self.rate)\n"
        return value
    }
}

extension Rate {
    
    var description: String {
        switch self {
            case .unrated:
            return "unrated"
            case .rated:
            return "rated"
        }
    }
    
    static func == (_ lhs: Rate, _ rhs: Rate) -> Bool {
        switch lhs {
            case .unrated:
                return rhs == .unrated
            case .rated(let valueLHS):
                switch rhs {
                    case .unrated:
                        return false
                    case .rated(let valueRHS):
                        return valueLHS == valueRHS
                }
        }
    }
}
