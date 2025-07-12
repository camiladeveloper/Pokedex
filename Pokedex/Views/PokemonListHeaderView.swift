//
//  PokemonListHeaderView.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 12/07/25.
//

import Foundation
import UIKit

final class PokemonListHeaderView: UIView {
	let searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		searchBar.placeholder = "Search Pokémon"
		return searchBar
	}()
	
	let segmentedControl: UISegmentedControl = {
		let segmentedControl = UISegmentedControl(items: ["All","Caught"])
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		segmentedControl.selectedSegmentIndex = 0
		return segmentedControl
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [searchBar,segmentedControl])
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	private func setupView() {
		addSubview(stackView)
		setupConstraints()
	}
	
	private func setupConstraints() {
		//
	}
}
