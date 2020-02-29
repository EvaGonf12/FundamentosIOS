//
//  ActorDetailsViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 25/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class ActorDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - DATA
    private var actor: Cast?
    
    
    // MARK: - INIT CONVENIENCE
    convenience init(withActor actor: Cast) {
        self.init()
        self.actor = actor
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
        let nib2 = UINib.init(nibName: "KeyValueTableViewCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "KeyValueTableViewCell")
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
                    if let image = self.actor?.avatar {
                        cell.setImage(image)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "KeyValueTableViewCell", for: indexPath) as? KeyValueTableViewCell {
                    if let fullName = self.actor?.fullname,
                        let role = self.actor?.role{
                        cell.setData(withKey: fullName, withValue: "\"\(role)\"")
                        cell.setFontText(19)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            case 2:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "KeyValueTableViewCell", for: indexPath) as? KeyValueTableViewCell {
                    if let episodes = self.actor?.episodes {
                        cell.setData(withKey: "Episodes:", withValue: "\(episodes)")
                        cell.setFontText(14)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            case 3:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "KeyValueTableViewCell", for: indexPath) as? KeyValueTableViewCell {
                    if let birth = self.actor?.birth {
                        cell.setData(withKey: "Birth:", withValue: birth)
                        cell.setFontText(14)
                    }
                    return cell
                }
                fatalError("No se ha podido crear la celda Episode")
            case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "KeyValueTableViewCell", for: indexPath) as? KeyValueTableViewCell {
                if let placeBirth = self.actor?.placeBirth {
                    cell.setData(withKey: "Place Birth:", withValue: placeBirth)
                    cell.setFontText(14)
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
