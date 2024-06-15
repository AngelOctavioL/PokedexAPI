//
//  TypeModel.swift
//  PokedexAPI
//
//  Created by Diplomado on 15/06/24.
//

class PokeTypeModel {
    var pokeTypesArray: [PokeType]?
    let requestHandler : RequestHandlerProtocol = RequestHandler()
    
    func pokeType(for index: Int) -> PokeType? {
        pokeTypesArray?[index]
    }
    
    func getPokeTypes() -> Int {
        pokeTypesArray?.count ?? 0
    }
}

extension PokeTypeModel {
    func getPokeTypes(completionHandler: @escaping (Error?) -> Void) {
        requestHandler.get(buildEndpoint()) { (result: Result<PokeTypeAPIResponse, Error>) in
            switch result {
            case .success(let response):
                self.pokeTypesArray = response.results.map { pokeTypes in
                    PokeType(name: pokeTypes.name)
                }
                completionHandler(nil)
            case .failure(let failure):
                completionHandler(failure)
            }
        }
    }

    func buildEndpoint() -> EndpointProtocol {
        return UserBaseEndpoint(path: "/type")
    }
}
