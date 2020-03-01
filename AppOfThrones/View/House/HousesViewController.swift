//
//  HousesViewController.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 13/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class HousesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - DATA
    private var houses: [House] = []
        
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    // MARK: - SETUP
    func setupUI() {
        self.title = "Houses"
        let nib = UINib.init(nibName: "HousesTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HousesTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "houses", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                // .self dice que eso va a ser un array de episodios pero no como objeto sino como tipo
                self.houses = try! decoder.decode([House].self, from: data)
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
        let houseDetailsViewController = HouseDetailsViewController(withHouse: self.houses[indexPath.row])
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(houseDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HousesTableViewCell", for: indexPath) as? HousesTableViewCell {
            let house = houses[indexPath.row]
            cell.setHouse(house)
            return cell
        }
        fatalError("No se ha podido crear la celda Episode")
    }
}
