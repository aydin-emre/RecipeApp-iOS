//
//  RecipesViewModel.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation
import RxSwift
import RxCocoa

class RecipesViewModel {

    let recipes: PublishSubject<Recipes> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()

    func requestData() {
        NetworkManager.shared.getAllRecipes { result in
            switch result {
            case .success(let response):
                self.recipes.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

}
