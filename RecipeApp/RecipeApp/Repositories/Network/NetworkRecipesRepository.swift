//
//  NetworkRecipesRepository.swift
//  RecipeApp
//
//  Created by Emre Aydın on 31.01.2022.
//

import Foundation

protocol RecipesProtocol {
    func getAllRecipes(completion: @escaping (Result<Recipes, Error>) -> Void)
    func getRecipes(with collectionId: Int, completion: @escaping (Result<Recipes, Error>) -> Void)
}

final class NetworkRecipesRepository: RecipesProtocol {

    func getAllRecipes(completion: @escaping (Result<Recipes, Error>) -> Void) {
        NetworkManager.shared.request(of: Recipes.self, for: NetworkPath.allRecipesPath,
                                      method: .get, showLoadingView: true) { response, error in
            if let response = response as? Recipes {
                completion(.success(response))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func getRecipes(with collectionId: Int, completion: @escaping (Result<Recipes, Error>) -> Void) {
        NetworkManager.shared.request(of: Recipes.self, for: String(format: NetworkPath.collectionRecipesPath, String(collectionId)),
                                      method: .get, showLoadingView: true) { response, error in
            if let response = response as? Recipes {
                completion(.success(response))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

}
