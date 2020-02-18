//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate {

    // MARK: - Model
    var episodes: [Episode] = [Episode.init(id: 1, name: "Winter is comming", date: "Abril 17, 2011", image: "episodeTest", episode: 1, season: 1, overview: "Jonh Arryn, the hand of the kin, is dead. King Robert..."),
    Episode.init(id: 1, name: "Winter is comming", date: "Abril 17, 2011", image: "episodeTest", episode: 1, season: 1, overview: "Jonh Arryn, the hand of the kin, is dead. King Robert..."),
    Episode.init(id: 1, name: "Winter is comming", date: "Abril 17, 2011", image: "episodeTest", episode: 1, season: 1, overview: "Jonh Arryn, the hand of the kin, is dead. King Robert..."),
    Episode.init(id: 1, name: "Winter is comming", date: "Abril 17, 2011", image: "episodeTest", episode: 1, season: 1, overview: "Jonh Arryn, the hand of the kin, is dead. King Robert...")]

    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - Setup
    
    func setupUI() {
        // Aquí va toda la configuración de Setup
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
    
    // MARK: - UITableViewDelegate
    
    // Responde a la pregunta de cuanto tiene que medir de alto
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se ha hecho tap en la celda con sección \(indexPath.section) y fila \(indexPath.row)")
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
    
    
    // MARK: - Actions
    
//    @IBAction func openRate(_ sender: Any) {
//        let rateViewController = RateViewController()
//        // Diferentes modos de presentación de la view
//        rateViewController.modalPresentationStyle = .fullScreen
//        self.present(rateViewController, animated: true, completion: nil)
//    }
    
}
