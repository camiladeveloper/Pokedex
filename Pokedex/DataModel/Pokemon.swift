//
//  Pokemon.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

struct Pokemon {
	let name: String
	let number: Int
	let pokemonImage: String
	let pokemonURL: URL?
}

extension Pokemon {
	static func mock() -> Pokemon {
		return Pokemon(name: "Koffing", number: 109, pokemonImage: "koffing")
	}
}
