//
//  LocalCollectionsRepository.swift
//  RecipeApp
//
//  Created by Emre Aydın on 31.01.2022.
//

import Foundation

class LocalCollectionsRepository: CollectionsProtocol {

    func getCollections(completion: @escaping (Result<Collections, Error>) -> Void) {
        let bundle = Bundle(for: type(of: self))
        if let response = bundle.decode(fromJSON: "Collections", of: Collections.self) {
            completion(.success(response))
        } else {
            completion(.failure(NetworkError.objectParseError))
        }
    }

}
