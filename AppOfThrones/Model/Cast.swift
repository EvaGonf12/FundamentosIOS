//
//  Cast.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

struct Cast : Codable, Identifiable, Equatable, CustomStringConvertible {
    
    var id: Int
    var avatar: String?
    var fullname : String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
}

extension Cast  {
    var description: String {
        let value = "CAST ITEM\n" +
                    "Id: \(self.id)\n" +
                    "Avatar: \(self.avatar ?? "nil")\n" +
                    "FullName: \(self.fullname ?? "nil")\n" +
                    "Role: \(self.role ?? "nil")\n" +
                    "Episodes: \(self.episodes ?? 0)\n" +
                    "Birth: \(self.birth ?? "nil")\n" +
                    "Place Birth: \(self.placeBirth ?? "nil")"
        return value
    }
    
    static func == (_ lhs: Cast, _ rhs: Cast) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.avatar == rhs.avatar &&
            lhs.fullname == rhs.fullname &&
            lhs.role == rhs.role &&
            lhs.episodes == rhs.episodes &&
            lhs.birth == rhs.birth &&
            lhs.placeBirth == rhs.placeBirth
    }
}
