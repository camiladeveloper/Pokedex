//
//  PokemonDetailResponse.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 10/06/25.
//

import Foundation

struct PokemonDetailResponse: Decodable {
	let name: String
	let height: Int
	let weight: Int
	let id: Int
	let types: [TypeElementResponse]
	
	func toDomain() -> PokemonDetail {
		let pokemonTypes = types.compactMap { PokemonType(rawValue: $0.type.name) }
		let pokemonImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
		return PokemonDetail(id: id, name: name, height: Double(height) / 10, weight: Double(weight) / 10, types: pokemonTypes, imageUrl: pokemonImageURL)
	}
}

struct TypeInfoResponse: Decodable {
	let name: String
}

struct TypeElementResponse: Decodable {
	let type: TypeInfoResponse
}
