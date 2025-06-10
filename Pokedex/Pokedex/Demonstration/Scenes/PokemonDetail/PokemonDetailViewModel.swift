//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

import Foundation

protocol PokemonDetailViewModelDelegate: AnyObject {
	func didLoadPokemonDetail(_ detail: PokemonDetail, isFavorited: Bool)
	func didFailToLoadDetail(with error: Error)
}

final class PokemonDetailViewModel {
	private let service = PokemonService()
	private let url = URL?
	private let repository: FavoritePokemonRepositoryProtocol
	
	private var currentDetail: PokemonDetail?
	
	weak var delegate: PokemonDetailViewModelDelegate?
	
	init(url: URL?, service: PokemonServiceProtocol, repository: FavoritePokemonRepositoryProtocol = FavoritePokemonRepositoryProtocol.shared ) {
		self.url = url
		self.service = service
		self.repository = repository
	}
	
	func fetchPokemonDetail() {
		guard let url = url else { return }
		
		service.fetchPokemonDetail(from: url) { [weak self] result in
			switch result {
			case .success(let pokemonDetail):
				self?.currentDetail = pokemonDetail
				self?.delegate?.didLoadPokemonDetail(pokemonDetail, isFavorited: self?.isFavorited() ?? false)
			case .failure(let error):
				self?.delegate?.didFailToLoadDetail(with: error)
			}
		}
	}
	
	func toggleFavorite() {
		guard let pokemon = currentDetail else { return }
		
		let name = pokemon.name.lowercased()
		
		if isFavorited() {
			repository.remove(name)
		} else {
			repository.add(name)
		}
	}
	
	private func isFavorited() -> Bool {
		guard let pokemon = currentDetail else { return false }
		return repository.contains(pokemon.name.lowercased())
	}
	
}
