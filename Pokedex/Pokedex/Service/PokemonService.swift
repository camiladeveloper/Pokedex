//
//  PokemonService.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

import Foundation

protocol PokemonServiceProtocol {
	func fetchPokemonList(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}

final class PokemonService: PokemonServiceProtocol {
	
	let networkClient = NetworkClient()
	
	func fetchPokemonList(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
		let urlString = "https://pokeapi.com/api/v2/pokemon?limit=151"
		
		networkClient.fetch(from: urlString, decodeTo: PokemonListResponse.self) { result in
			switch result {
			case .success(let response):
				let pokemons = response.results.map { $0.toDomainModel()}
				completion(.success(pokemons))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
	func fetchPokemonDetail(from url: URL, completion: @escaping (Result<[PokemonDetail], Error>) -> Void) {
		networkClient.fetch(from: url.absoluteString, decodeTo: PokemonDetailResponse.self) { result in
			switch result {
			case .success(let response):
				completion(.success(response.toDomain()))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}

//MARK: - ServiceError

enum ServiceError: Error {
	case invalidURL
	case emptyData
}
