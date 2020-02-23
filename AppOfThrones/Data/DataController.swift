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


// El controlador PURO -> encargado de la lógica
class DataController {
    
    // MARK: - SHARED
    // Todo lo que va después de static es una variable de clase a laque se puede llamar sin instanciar la clase
    static var shared = DataController()
    
    // MARK: - MODEL
    // Debe ponerse PRIVATE porque ya que es un singleton así nos evitamos que se pueda tocar por todo el código
    private var ratings: [Rating] = []
    private var favorite : [Int] = [] {
        didSet {
            print("FAVORITE \(favorite)")
        }
    }
    
    // MARK: - FAVORITE
    
    func cleanFavorite() {
        self.favorite = []
    }
    
    // T, M, U, V -> Represeta una clase que conforma protocolo TAL
    // Para varios parámetros: <T: Identifiable, M: OtroProtocolo, ... >
    func isFavorite<T: Identifiable>(_ value: T) -> Bool {
        return favorite.contains(value.id)
    }
    
    func removeFavorite<T: Identifiable>(_ value: T) {
        if let index = favorite.firstIndex(of: value.id) {
            favorite.remove(at: index)
        }
    }
    
    func addFavorite<T: Identifiable>(_ value : T) {
        favorite.append(value.id)
        // No debería estar por hacer doble comprobación
        // Se está comprobando al pulsar el botón de favorito y una vez comprobado se vuelve a comprobar al hacer la llamada de añadir
//        if self.isFavorite(value) == false {
//            favorite.append(value.id)
//        }
    }
    
    // MARK: - RATING
    
    // Esto puntúa a un episodio
    func rateEpisode(_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            let rateValue = Rating.init(id: episode.id, rate: Rate.rated(value: value))
            ratings.append(rateValue)
        }
    }
    
    // Borra la puntuación de un episodio
    func removeRateEpisode(_ episode: Episode) {
        if let index = self.ratings.firstIndex(where: { (rating) -> Bool in
            return episode.id == rating.id
        }) {
            self.ratings.remove(at: index)
        }
    }
    
    // Devuelve el estado de Rating del Episodio
    func ratingForEpisode(_ episode: Episode) -> Rating? {
        let filtered = ratings.filter { (rating) -> Bool in
            return rating.id == episode.id // Es un return que no hace falta poner
        }
        return filtered.first
    }
    
}
