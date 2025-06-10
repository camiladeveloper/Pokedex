//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 10/06/25.
//

import Foundation

struct PokemonListResponse: Decodable {
	let results: [PokemonResponse]
}

struct PokemonResponse {
	let name: String
	let url: String
	
	func toDomainModel() -> Pokemon {
		let pokemonNumber = url.extractPokemonNumber()
		let pokemonImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonNumber).png"
		let pokemonURL: URL? = URL(string: url)
		return Pokemon(name: name.capitalized, number: pokemonNumber, pokemonImage: pokemonImageURL, pokemonURL: pokemonURL)
	}
}

extension String {
	func extractPokemonNumber() -> Int {
		let components = self.split(separator: "/")
		if let lastComponent = components.last, lastComponent.isEmpty, components.count > 1 {
			return Int(components[components.count - 2]) ?? 0
		} else if let lastComponent = components.last {
			return Int(lastComponent) ?? 0
		}
	}
}
