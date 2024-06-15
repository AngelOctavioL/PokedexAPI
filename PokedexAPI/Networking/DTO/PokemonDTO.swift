//
//  PokemonDTO.swift
//  PokedexAPI
//
//  Created by Diplomado on 15/06/24.
//

import Foundation

struct PokemonAPIResponse: Decodable {
    let results: [PokemonDTO]
}

struct PokemonDTO: Decodable {
    let name: String
    let url: String
}
