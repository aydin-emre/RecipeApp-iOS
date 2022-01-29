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
    private let recipesRepository: RecipesRepository
    private let collectionId: Int?

    init(recipesRepository: RecipesRepository, collectionId: Int? = nil) {
        self.recipesRepository = recipesRepository
        self.collectionId = collectionId
    }

    func requestData() {
        recipesRepository.getRecipes(collectionId: collectionId) { result in
            switch result {
            case .success(let response):
                self.recipes.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

}
