//
//  Episode.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

class Episode : Codable, Identifiable, Equatable, CustomStringConvertible {

    var id: Int
    var name: String?
    var date: String?
    var image: String?
    var episode: Int
    var season: Int
    var overview: String
    
    init(id: Int, name: String?, date: String?, image: String?, episode: Int, season: Int, overview: String) {
        self.id = id
        self.name = name
        self.date = date
        self.image = image
        self.episode = episode
        self.season = season
        self.overview = overview
    }
}

extension Episode  {
    var description: String {
        let value = "EPISODE ITEM\n" +
                    "Id: \(self.id)\n" +
                    "Name: \(self.name ?? "nil")\n" +
                    "Date: \(self.date ?? "nil")\n" +
                    "Image: \(self.image ?? "nil")\n" +
                    "Episode: \(self.episode)\n" +
                    "Season: \(self.season)\n" +
                    "Overview: \(self.overview)"
        return value
    }
    
    static func == (_ lhs: Episode, _ rhs: Episode) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.date == rhs.date &&
            lhs.image == rhs.image &&
            lhs.episode == rhs.episode &&
            lhs.season == rhs.season &&
            lhs.overview == rhs.overview
    }
}
