//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate {
    
    // Debido al bug que hay en Xcode
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - MODEL
    var cast: [Cast] = []
    
    // MARK: - LIFE CYCLE
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
        self.tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actorDetailsViewController = ActorDetailsViewController(withActor: self.cast[indexPath.row])
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(actorDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
