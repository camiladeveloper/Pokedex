//
//  PokemonCellView.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

import UIKit

class PokemonCellView: UIView {

	private let nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	private let numberLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupLayout() {
		self.addSubview(nameLabel)
		self.addSubview(numberLabel)
		backgroundColor = .white
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
			nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			
		])
	}
	
	public func configure(with pokemon: Pokemon) {
		nameLabel.text = pokemon.name
		numberLabel.text = pokemon.number
	}
}

