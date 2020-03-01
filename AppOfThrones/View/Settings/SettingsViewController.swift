//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

// MARK: - PROTOCOLS
protocol ReviewsDelegate {
    func didReviewsChanged()
}

class SettingsViewController: UIViewController {
    
    // Debido al bug que hay en Xcode
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var cleanFavorites: UIButton!
    @IBOutlet weak var deleteEpisodesReviewsButton: UIButton!
    
    // MARK: - DELEGATES
    var episodesDelegate : ReviewsDelegate?
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cleanFavorites.layer.cornerRadius = 4
        self.deleteEpisodesReviewsButton.layer.cornerRadius = 4
    }

    // MARK: - IBACTIONS
    @IBAction func cleanFavoritesAction(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Favorites", message: "Are you sure you want to remove all information from favorites?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { action in
            DataController.shared.cleanFavorite()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteEpisodesReviewsAction(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Reviews", message: "Are you sure you want to delete all the reviews made?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { action in
            DataController.shared.deleteEpisodesReviews()
            self.episodesDelegate?.didReviewsChanged()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
