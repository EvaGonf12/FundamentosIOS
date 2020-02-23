//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate {
    

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - MODEL
    var cast: [Cast] = []
    
    // MARK: - CICLO DE VIDA
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData()
    }

    // MARK: - SETUP
    func setupUI() {
        self.title = "Cast"
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        // Cada celda tiene una matrícula como la de un coche
        self.tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
        // Se especifica que es el controller (el fileOwner) el encargado de gestionar la tabla
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "cast", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                // .self dice que eso va a ser un array de episodios pero no como objeto sino como tipo
                cast = try! decoder.decode([Cast].self, from: data)
                self.tableView.reloadData()
            } catch {
                // Cierra inesperadamente la APP
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("No se pudo obtener el path de la url")
        }
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
            cell.delegate = self
            cell.setCast(actor)
            return cell
        }
        fatalError("No se ha podido crear la celda Episode")
    }
    
    // MARK: - CastTableViewCellDelegate
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
}
