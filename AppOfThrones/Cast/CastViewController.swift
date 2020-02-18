//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cast: [Cast] = [Cast(id: 1, avatar: "asjkdbuaosid", fullName: "Emilia Clarke", role: "dssadsad", episode: 73, birth: "1985-05-23", placeBirth: "sdkfbsdiufg"),
    Cast(id: 2, avatar: "asjkdbuaosid", fullName: "asdndisubf", role: "dssadsad", episode: 73, birth: "1985-05-23", placeBirth: "sdkfbsdiufg"),
    Cast(id: 3, avatar: "asjkdbuaosid", fullName: "asdndisubf", role: "dssadsad", episode: 73, birth: "1985-05-23", placeBirth: "sdkfbsdiufg"),
    Cast(id: 4, avatar: "asjkdbuaosid", fullName: "asdndisubf", role: "dssadsad", episode: 73, birth: "1985-05-23", placeBirth: "sdkfbsdiufg")]
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        let castController = DataController.shared
        //castController.id = 5
        print("CastController id \(castController.id)")
    }

    // MARK: - Setup
    func setupUI() {
        self.title = "Cast"
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        // Cada celda tiene una matrícula como la de un coche
        self.tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
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
        return cast.count
    }
    
    // ¿Que celda tengo que mostrar en el indexPath dado?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Se crea la celda
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell {
            let actor = cast[indexPath.row]
            cell.setCast(actor)
            return cell
        }
        fatalError("No se ha podido crear la celda Episode")
    }
}
