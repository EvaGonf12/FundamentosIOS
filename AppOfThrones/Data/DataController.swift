//
//  DataController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

protocol FavoriteDelegate {
    func didFavoriteChanged()
}

protocol Identifiable {
    var id: Int {get}
}

class DataController {
    
    // MARK: - SHARED
    static var shared = DataController()
    
    // MARK: - MODEL
    private var ratings: [Rating] = []
    private var favorite : [Int] = []
    
    // MARK: - FAVORITE
    
    // T, M, U, V -> Represeta una clase que conforma protocolo TAL
    // Para varios parámetros: <T: Identifiable, M: OtroProtocolo, ... >
    func isFavorite<T: Identifiable>(_ value: T) -> Bool {
        return favorite.contains(value.id)
    }
    
    func cleanFavorite() {
        self.favorite = []
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    
    func removeFavorite<T: Identifiable>(_ value: T) {
        if let index = favorite.firstIndex(of: value.id) {
            favorite.remove(at: index)
            let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
            NotificationCenter.default.post(name: noteName, object: nil)
        }
    }
    
    func addFavorite<T: Identifiable>(_ value : T) {
        favorite.append(value.id)
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    
    func getFavEpisodesList() -> [Episode] {
        var favEpisodes : [Episode] = []
        var episodes : [Episode] = []
        
        for seasonNumber in 1...8 {
            if  let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json") {
                let data = try! Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                do {
                    let episodesData = try decoder.decode([Episode].self, from: data)
                    episodes.append(contentsOf: episodesData)
                } catch {
                    fatalError(error.localizedDescription)
                }
            } else {
                fatalError("No se pudo obtener el path de la url")
            }
        }
            
        // Se crea la nueva lista
        for episode in episodes {
            if self.isFavorite(episode) {favEpisodes.append(episode)}
        }
        return favEpisodes
    }
    
    // MARK: - RATING
    
    func rateEpisode(_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            let rateValue = Rating.init(id: episode.id, rate: Rate.rated(value: value))
            ratings.append(rateValue)
        }
    }
    
    func removeRateEpisode(_ episode: Episode) {
        if let index = self.ratings.firstIndex(where: { (rating) -> Bool in
            return episode.id == rating.id
        }) {
            self.ratings.remove(at: index)
        }
    }
    
    func ratingForEpisode(_ episode: Episode) -> Rating? {
        let filtered = ratings.filter { (rating) -> Bool in
            return rating.id == episode.id
        }
        return filtered.first
    }
    
    func deleteEpisodesReviews() {
        self.ratings = []
    }
    
}
