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

    init(recipesProtocol: RecipesProtocol, collectionId: Int? = nil) {
        self.recipesProtocol = recipesProtocol
        self.collectionId = collectionId
    }

    func requestData() {
        if let collectionId = collectionId {
            recipesProtocol.getRecipes(with: collectionId) { result in
                self.process(result: result)
            }
        } else {
            recipesProtocol.getAllRecipes { result in
                self.process(result: result)
            }
        }
    }

    private func process(result: Result<Recipes, Error>) {
        switch result {
        case .success(let response):
            self.recipes.onNext(response)
        case .failure(let error):
            self.error.onNext(error.localizedDescription)
        }
    }

}
