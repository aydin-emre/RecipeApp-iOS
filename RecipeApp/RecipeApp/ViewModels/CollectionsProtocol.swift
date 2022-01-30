//
//  CollectionsProtocol.swift
//  RecipeApp
//
//  Created by Emre on 30.01.2022.
//

import Foundation

protocol CollectionsProtocol {
    func getCollections(completion: @escaping (Result<Collections, Error>) -> Void)
}

class NetworkCollections: CollectionsProtocol {

    func getCollections(completion: @escaping (Result<Collections, Error>) -> Void) {
        NetworkManager.shared.getAllCollections { result in
            completion(result)
        }
    }

}

class LocalCollections: CollectionsProtocol {

    func getCollections(completion: @escaping (Result<Collections, Error>) -> Void) {
        let bundle = Bundle(for: type(of: self))
        if let response = bundle.decode(fromJSON: "Collections", of: Collections.self) {
            completion(.success(response))
        } else {
            completion(.failure(NetworkError.objectParseError))
        }
    }

}
