//
//  UIViewController+Extensions.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

import UIKit

extension UIViewController {
	func showAlert(title: String = "Erro", message: String, buttonTitle: String = "OK") {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
		present(alert, animated: true)
		
	}
}
