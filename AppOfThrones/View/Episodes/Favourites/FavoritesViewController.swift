//
//  favoritesViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 29/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
             return .lightContent
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - DATA
    private var favEpisodes: [Episode] = []
    
    // MARK: - CICLO DE VIDA
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData()
    }
    
    // MARK: - SETUP
    func setupUI() {
        self.title = "Favorites"
        let nib = UINib.init(nibName: "FavoritesTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "FavoritesTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - DEINIT
    deinit {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupData() {
        self.favEpisodes = DataController.shared.getFavEpisodesList()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let epDetailsViewController = EpisodeDetailsViewController(withEpisode: self.favEpisodes[indexPath.row])
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(epDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell {
            let ep = self.favEpisodes[indexPath.row]
            cell.setEpisode(ep)
            return cell
        }
        fatalError("No se ha podido crear la celda Episode")
    }
    
    // MARK: - FAVORITE LIST CHANGED
    @objc func didFavoriteChanged() {
        self.setupData()
        self.tableView.reloadData()
    }

}
