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
        
    }
    
    func removeRateEpisode(_ episode: Episode) {
        
    }
    
    func ratingForEpisode(_ episode: Episode) -> Rating {
        
    }
    
}
