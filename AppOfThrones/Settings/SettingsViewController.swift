//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var cleanFavorites: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cleanFavoritesAction(_ sender: Any) {
        // Como hay que advertir a varios elementos de eliminar favoritos -> NOTIFICACIONES (NOTIFICATION CENTER)
        DataController.shared.cleanFavorite()
        
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        
        NotificationCenter.default.post(name: noteName, object: nil)
    }
}
