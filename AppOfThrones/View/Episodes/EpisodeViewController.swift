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
    
    // MARK: - DATA
    var episodes: [Episode] = []
        
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData(1)
    }
    
    // MARK: - DEINIT
    deinit {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    // MARK: - SETUP
    func setupUI() {
        self.title = "Seasons"
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupData(_ seasonNumber: Int) {
        if  let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json") {
            let data = try! Data.init(contentsOf: pathURL)
            let decoder = JSONDecoder()
            do {
                episodes = try decoder.decode([Episode].self, from: data)
                self.tableView.reloadData()

            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("No se pudo obtener el path de la url")
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rateViewController = RateViewController()
        self.present(rateViewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - RateViewControllerDelegate
    func didRateChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let ep = episodes[indexPath.row]
            cell.delegate = self
            cell.setEpisode(ep)
            cell.rateBlock = { () -> Void in
                let rateViewController = RateViewController.init(withEpisode: ep)
                rateViewController.delegate = self
                let navigationController = UINavigationController.init(rootViewController: rateViewController)
                self.present(navigationController, animated: true, completion: nil)
            }
            return cell
        }
        fatalError("No se ha podido crear la celda Episode")
    }
    
    // MARK: - DELEGATE
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - IBACTIONS
    
    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        let seasonNumber = sender.selectedSegmentIndex + 1
        self.setupData(seasonNumber)
    }
    
}
