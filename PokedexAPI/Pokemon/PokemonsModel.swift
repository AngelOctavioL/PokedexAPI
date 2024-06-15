//
//  PokemonsModel.swift
//  PokedexAPI
//
//  Created by Diplomado on 15/06/24.
//

class PokemonsModel {
    var pokemons: [Pokemon]?
    let requestHandler : RequestHandlerProtocol = RequestHandler()
    
    func pokemon(for index: Int) -> Pokemon? {
        pokemons?[index]
    }
    
    func getPokemons() -> Int {
        pokemons?.count ?? 0
    }
}

extension PokemonsModel {
    func getPokemones(completionHandler: @escaping (Error?) -> Void) {
        requestHandler.get(buildEndpoint()) { (result: Result<PokemonAPIResponse, Error>) in
            switch result {
            case .success(let response):
                self.pokemons = response.results.map { poke in
                    Pokemon(name: poke.name)
                }
                completionHandler(nil)
            case .failure(let failure):
                completionHandler(failure)
            }
        }
    }

    func buildEndpoint() -> EndpointProtocol {
        return UserBaseEndpoint(path: "/pokemon")
    }
}
