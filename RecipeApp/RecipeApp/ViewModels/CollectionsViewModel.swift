//
//  CollectionsViewModel.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation
import RxSwift
import RxCocoa

class CollectionsViewModel {

    let collections: PublishSubject<Collections> = PublishSubject()
    let recipes: PublishSubject<Recipes> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()

    func requestData() {
        NetworkManager.shared.getAllCollections { result in
            switch result {
            case .success(let response):
                self.collections.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

    func requestData(with collectionId: Int) {
        NetworkManager.shared.getCollectionRecipes(with: collectionId) { result in
            switch result {
            case .success(let response):
                self.recipes.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

}
