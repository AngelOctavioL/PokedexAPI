//
//  TypesViewController.swift
//  PokedexAPI
//
//  Created by Diplomado on 15/06/24.
//

import UIKit

class TypesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var typesModel = PokeTypeModel()
    private var tipos: [PokeType] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchPokes()
    }
    
    func fetchPokes() {
        typesModel.getPokeTypes { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.presentErrorAlert(title: "Error", message: error.localizedDescription)
                    return
                }
                self?.tipos = self?.typesModel.pokeTypesArray ?? []
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath)
        let tiposDos = tipos[indexPath.row]
        cell.textLabel?.text = tiposDos.name
        return cell
    }
}
