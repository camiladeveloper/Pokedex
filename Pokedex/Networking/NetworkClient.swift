//
//  NetworkClient.swift
//  Pokedex
//
//  Created by Camila Ribeiro Rodrigues on 09/06/25.
//

import Foundation

class NetworkClient {
	
	func fetch<T:Decodable>(from urlString: String, decodeTo type: T.Type, completion: @escaping (Result<T, Error>) -> Void ) {
		guard let url = URL(string: urlString) else {
			completion(.failure(ServiceError.invalidURL))
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				completion(.failure(error))
				return
			}
			
			guard let data = data else {
				completion(.failure(ServiceError.emptyData))
				return
			}
			
			do {
				let decode = try JSONDecoder().decode(T.self, from: data)
				completion(.success(decode))
			} catch {
				completion(.failure(error))
			}
		}.resume()
	}
}
