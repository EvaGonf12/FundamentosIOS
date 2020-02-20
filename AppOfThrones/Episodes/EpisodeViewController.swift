//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate, FavoriteDelegate {

    // MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - MODEL
    var episodes: [Episode] = [
        Episode.init(id: 1, name: "Winter is comming", date: "Abril 17, 2011", image: "3pcFXQOKHnZhRkGCQ7Y8HRB1v8V", episode: 1, season: 1, overview: "April 17, 2011"),
        Episode.init(id: 2, name: "Winter is comming", date: "Abril 17, 2011", image: "4j2j97GFao2NX4uAtMbr0Qhx2K2", episode: 1, season: 1, overview: "April 24, 2011"),
        Episode.init(id: 3, name: "Winter is comming", date: "Abril 17, 2011", image: "6FcfWGFlDyWZ2JvQi8uvkxbDx1z", episode: 1, season: 1, overview: "May 1, 2011"),
        Episode.init(id: 4, name: "Winter is comming", date: "Abril 17, 2011", image: "9ZvT1IZPcC11eiCByOzqQvC3CCR", episode: 1, season: 1, overview: "May 8, 2011")
    ]

        
    // MARK: - CICLO DE VIDA
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
    }
    
    deinit {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    // MARK: - SETUP
    func setupUI() {
        self.title = "Seasons"
        // El bundle es el saco de recursos: imagen, audio, .xib, etc
        // Cada vez el bundle se usa menos porque tenemos los xcassets
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        // Cada celda tiene una matrícula como la de un coche
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        // Se especifica que es el controller (el fileOwner) el encargado de gestionar la tabla
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    // MARK: - UITableViewDelegate
    
    // Responde a la pregunta de cuanto tiene que medir de alto
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rateViewController = RateViewController()
        self.present(rateViewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        // Se va a ejecutar si permite la seleccion de la celda
        return true
    }
    
    // MARK: - RateViewControllerDelegate
    
    func didRateChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    // Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    // ¿Que celda tengo que mostrar en el indexPath dado?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Se crea la celda
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            // Todas las variables dentro de la clausura solo existirán durante la vida de la clausura
            let ep = episodes[indexPath.row]
            cell.delegate = self
            cell.setEpisode(ep)
            cell.rateBlock = { () -> Void in
                // En este momento podemos decir que se CAPTURA EL AMBIENTE DE ESE MOMENTO
                let rateViewController = RateViewController.init(withEpisode: ep)
                rateViewController.delegate = self
                // Crea una barra para poner título y demás
                let navigationController = UINavigationController.init(rootViewController: rateViewController)
                self.present(navigationController, animated: true, completion: nil)
            }
            return cell
        }
        fatalError("No se ha podido crear la celda Episode")
    }
    
    // MARK: DELEGATE
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
}
