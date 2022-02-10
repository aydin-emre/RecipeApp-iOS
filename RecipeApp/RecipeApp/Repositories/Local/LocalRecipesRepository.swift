//
//  LocalRecipesRepository.swift
//  RecipeApp
//
//  Created by Emre Aydın on 31.01.2022.
//

import Foundation

final class LocalRecipesRepository: RecipesProtocol {

    func getAllRecipes(completion: @escaping (Result<Recipes, Error>) -> Void) {
        let bundle = Bundle(for: type(of: self))
        let response = bundle.decode(fromJSON: "Recipes", of: Recipes.self)
        completion(.success(response))
    }

    func getRecipes(with collectionId: Int, completion: @escaping (Result<Recipes, Error>) -> Void) {
        let bundle = Bundle(for: type(of: self))
        let response = bundle.decode(fromJSON: "CollectionRecipes", of: Recipes.self)
        completion(.success(response))
    }

}
