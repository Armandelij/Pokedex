//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Elijah Armande on 6/4/22.
//

import Foundation


class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    //MARK: - Grabes the data of the pokemon
    func getDetailedPokemon(id: Int, _ completion:@escaping (DetailedPokemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailedPokemon.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
