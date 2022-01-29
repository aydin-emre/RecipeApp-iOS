//
//  RecipesProtocol.swift
//  RecipeApp
//
//  Created by Emre on 29.01.2022.
//

import Foundation

protocol RecipesRepository {

    func getRecipes(collectionId: Int?, completion: @escaping (Result<Recipes, Error>) -> Void)

}

class NetworkRecipesRepository: RecipesRepository {

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

class LocalRecipesRepository: RecipesRepository {

    func getRecipes(collectionId: Int? = nil, completion: @escaping (Result<Recipes, Error>) -> Void) {

    }

}
