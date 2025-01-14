//
//  ViewController.swift
//  PokedexAPI
//
//  Created by Diplomado on 15/06/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var pokesModel = PokemonsModel()
    private var pokemons: [Pokemon] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchPokes()
    }
    
    func fetchPokes() {
        pokesModel.getPokemones { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.presentErrorAlert(title: "Error", message: error.localizedDescription)
                    return
                }
                self?.pokemons = self?.pokesModel.pokemons ?? []
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        let pokemon = pokemons[indexPath.row]
        cell.textLabel?.text = pokemon.name
        return cell
    }
}
