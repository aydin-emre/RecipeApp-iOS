//
//  NetworkCollectionsRepository.swift
//  RecipeApp
//
//  Created by Emre Aydın on 31.01.2022.
//

import Foundation

protocol CollectionsProtocol {
    func getCollections(completion: @escaping (Result<Collections, Error>) -> Void)
}

class NetworkCollectionsRepository: CollectionsProtocol {

    func getCollections(completion: @escaping (Result<Collections, Error>) -> Void) {
        NetworkManager.shared.request(of: Collections.self, for: NetworkPath.allCollectionsPath,
                                      method: .get, showLoadingView: true) { response, error in
            if let response = response as? Collections {
                completion(.success(response))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

}
