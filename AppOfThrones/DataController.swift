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
    
//    var rating : [Rating] = []
    // Todo lo que va después de static es una variable de clase a laque se puede llamar sin instanciar la clase
    static var shared = DataController()
    private init() {}
    var id: Int = 0
}
