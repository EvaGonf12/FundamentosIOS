//
//  DataController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 17/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import Foundation

// El controlador PURO -> encargado de la lógica
class DataController {
    
    // Todo lo que va después de static es una variable de clase a laque se puede llamar sin instanciar la clase
    static var shared = DataController()
    private init() {}
    
    // Debe ponerse PRIVATE porque ya que es un singleton así nos evitamos que se pueda tocar por todo el código
    private var ratings: [Rating] = []
    
    // MARK: - Rating
    
    func rateEpisode(_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            print("No existe el episodio")
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
            rating.id == episode.id // Es un return que no hace falta poner
        }
        return filtered.first
    }
    
}
