//
//  HousesViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class HousesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Debido al bug que hay en Xcode
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Model
    let houses: [House] = [
        House.init(imageName: "Arryn", name: "Casa Arryn", words: "Tan alto como el honor", seat: "Ni idea que es esto"),
        House.init(imageName: "Baratheon", name: "Casa Baratheon", words: "Nuestra es la Furia", seat: "Ni idea que es esto"),
        House.init(imageName: "Greyjoy", name: "Casa Greyjoy", words: "Nosotros no Sembramos", seat: "Ni idea que es esto"),
        House.init(imageName: "Lannister", name: "Casa Lannister", words: "¡Oye mi rugido!", seat: "Ni idea que es esto"),
        House.init(imageName: "Martell", name: "Casa Martell", words: "Nunca doblegado, Nunca roto", seat: "Ni idea que es esto"),
        House.init(imageName: "Stark", name: "Casa Stark", words: "Se acerca el invierno", seat: "Ni idea que es esto"),
        House.init(imageName: "Targaryen", name: "Casa Targaryen", words: "Sangre y fuego", seat: "Ni idea que es esto"),
        House.init(imageName: "Tully", name: "Casa Tully", words: "Familia, Deber, Honor", seat: "Ni idea que es esto"),
        House.init(imageName: "Tyrell", name: "Casa Tyrell", words: "Crecer fuerte", seat: "Ni idea que es esto")]
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - Setup
    func setupUI() {
        self.title = "Houses"
        let nib = UINib.init(nibName: "HousesTableViewCell", bundle: nil)
        // Cada celda tiene una matrícula como la de un coche
        self.tableView.register(nib, forCellReuseIdentifier: "HousesTableViewCell")
        // Se especifica que es el controller (el fileOwner) el encargado de gestionar la tabla
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - UITableViewDelegate
    
    // Responde a la pregunta de cuanto tiene que medir de alto
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se ha hecho tap en la celda con sección \(indexPath.section) y fila \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    // Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    // ¿Que celda tengo que mostrar en el indexPath dado?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Se crea la celda
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HousesTableViewCell", for: indexPath) as? HousesTableViewCell {
            let house = houses[indexPath.row]
            cell.setHouse(house)
            return cell
        }
        fatalError("No se ha podido crear la celda Episode")
    }
}
