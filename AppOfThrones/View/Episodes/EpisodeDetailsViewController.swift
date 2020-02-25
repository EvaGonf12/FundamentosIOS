//
//  EpisodeDetailsViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 23/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - DATA
    private var episode: Episode?
    
    // MARK: - INIT CONVENIENCE
    convenience init(withEpisode episode: Episode) {
        self.init()
        self.episode = episode
    }
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
  
    // MARK: - SETUP
    func setupUI() {
        let nib1 = UINib.init(nibName: "ImageTableViewCell", bundle: nil)
        self.tableView.register(nib1, forCellReuseIdentifier: "ImageTableViewCell")
        let nib2 = UINib.init(nibName: "EpisodeDetailsTableViewTitleCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "EpisodeDetailsTableViewTitleCell")
        let nib3 = UINib.init(nibName: "EpisodeDetailsTableViewSeasonCell", bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "EpisodeDetailsTableViewSeasonCell")
        let nib4 = UINib.init(nibName: "EpisodeDetailsTableViewOverviewCell", bundle: nil)
        self.tableView.register(nib4, forCellReuseIdentifier: "EpisodeDetailsTableViewOverviewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK: - RateViewControllerDelegate
    func didRateChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 234
        } else {
            return 44
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
                    if let image = self.episode?.image {
                        cell.setImage(image)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailsTableViewTitleCell", for: indexPath) as? EpisodeDetailsTableViewTitleCell {
                    if let name = self.episode?.name,
                        let episodeNumber = self.episode?.episode,
                        let date = self.episode?.date {
                        cell.setCell(withName: name, withEpisodeNumber: episodeNumber, onDate: date)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            case 2:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailsTableViewSeasonCell", for: indexPath) as? EpisodeDetailsTableViewSeasonCell {
                    if let season = self.episode?.season {
                        cell.setSeasonNumber(season)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            case 3:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailsTableViewOverviewCell", for: indexPath) as? EpisodeDetailsTableViewOverviewCell {
                    if let overview = self.episode?.overview {
                        cell.setSeasonOverview(overview)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            default:
            fatalError("No se ha podido crear la celda Episode")
        }
        fatalError("No se ha podido crear la celda Episode")
    }
    
}
