//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

import UIKit

class PokemonDetailView: UIView {
	
	private let typeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	private lazy var stackView: UIStackView = {
		let stackView = UIStackView(
			arrangedSubviews: [
				typeLabel
			]
		)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .white
		setupLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupLayout() {
		addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor),
			
			//imageView.heightAnchor.constraint(equalTo: 200),
			//imageView?.widthAnchor.constraint(equalTo: 200),
			typeLabel.heightAnchor.constraint(equalToConstant: 30),
			typeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),

		])
	}
	
	func configure(with pokemonDetail: PokemonDetail) {
		//nameLabel.text = pokemonDetail.name
		//imageView.image = UIImage(named: pokemonDetail.imageUrl)
		let typesText = pokemonDetail.types.map { $0.getTitle() }.joined(separator: ", ")
		typeLabel.text = typesText
		//highLabel.text = "Heigh: \(pokemonDetail.height)m"
		//weightLabel.text = "Weight: \(pokemonDetail.weight)kg"
		
		if let primaryType = pokemonDetail.types.first {
			typeLabel.backgroundColor = primaryType.getColor()
			backgroundColor = primaryType.getColor()
		}
	}
}
