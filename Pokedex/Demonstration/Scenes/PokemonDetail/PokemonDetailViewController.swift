//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

import UIKit

class PokemonDetailViewController: UIViewController {
	let pokemonDetailView = PokemonDetailView()
	let pokemonURL: URL?

	private let viewModel = PokemonDetailViewModel()
	
	init(url: URL?) {
		self.viewModel = PokemonDetailViewModel(url: url)
		super.init(nibName: nil, bundle: nil)
		viewModel.delegate = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = pokemonDetailView
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.fetchPokemonDetail(url: pokemonURL)
	}
}

extension PokemonDetailViewController: PokemonDetailViewModelDelegate {
	func didLoadPokemonDetail(_ detail: PokemonDetail, isFavorited: Bool) {
		DispatchQueue.main.async {
			self.pokemonDetailView.configure(with: detail)
			//self.pokemonDetailView.configure(with: detail, isFavorite: isFavorited)
		}
	}
	
	func didFailToLoadDetail(with error: Error) {
		DispatchQueue.main.async {
			self.showAlert(message: error.localizedDescription)
		}
	}
}

//extension PokemonDetailViewController: PokemonDetailViewDelegate {
//	func didTapFavorite() {
//		viewModel.toggleFavorite()
//	}
//}
