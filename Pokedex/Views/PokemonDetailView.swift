//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Elijah Armande on 6/4/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(vm.format(value: vm.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height**: \(vm.format(value: vm.pokemonDetails?.weight ?? 0)) M")
            }
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: .samplePokemon)
            .environmentObject(ViewModel())
    }
}
