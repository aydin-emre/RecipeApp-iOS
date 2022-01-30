//
//  RecipesProtocol.swift
//  RecipeApp
//
//  Created by Emre on 29.01.2022.
//

import Foundation

protocol RecipesProtocol {
    func getRecipes(collectionId: Int?, completion: @escaping (Result<Recipes, Error>) -> Void)
}

class NetworkRecipes: RecipesProtocol {

    func getRecipes(collectionId: Int? = nil, completion: @escaping (Result<Recipes, Error>) -> Void) {
        if let collectionId = collectionId {
            NetworkManager.shared.getCollectionRecipes(with: collectionId) { result in
                completion(result)
            }
        } else {
            NetworkManager.shared.getAllRecipes { result in
                completion(result)
            }
        }
    }

}

class LocalRecipes: RecipesProtocol {

    func getRecipes(collectionId: Int? = nil, completion: @escaping (Result<Recipes, Error>) -> Void) {
        let bundle = Bundle(for: type(of: self))
        if let response = bundle.decode(fromJSON: "Recipes", of: Recipes.self) {
            completion(.success(response))
        } else {
            completion(.failure(NetworkError.objectParseError))
        }
    }

}
