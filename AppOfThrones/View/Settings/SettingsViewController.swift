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
        DataController.shared.cleanFavorite()
    }
    
    @IBAction func deleteEpisodesReviewsAction(_ sender: Any) {
        DataController.shared.deleteEpisodesReviews()
        self.episodesDelegate?.didReviewsChanged()
    }
}
