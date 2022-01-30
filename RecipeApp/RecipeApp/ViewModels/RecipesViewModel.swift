//
//  RecipesViewModel.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation
import RxSwift
import RxCocoa

class RecipesViewModel: BaseViewModel {

    let recipes: PublishSubject<Recipes> = PublishSubject()
    private let recipesProtocol: RecipesProtocol
    private let collectionId: Int?

    init(_ recipesProtocol: RecipesProtocol = NetworkRecipes(), collectionId: Int? = nil) {
        self.recipesProtocol = recipesProtocol
        self.collectionId = collectionId
    }

    func requestData() {
        recipesProtocol.getRecipes(collectionId: collectionId) { result in
            switch result {
            case .success(let response):
                self.recipes.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

}
