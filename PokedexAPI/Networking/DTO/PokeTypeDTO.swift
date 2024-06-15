//
//  TypeDTO.swift
//  PokedexAPI
//
//  Created by Diplomado on 15/06/24.
//

import Foundation

struct PokeTypeAPIResponse: Decodable {
    let results: [PokemonDTO]
}

struct PokeTypeDTO: Decodable {
    let name: String
    let url: String
}
