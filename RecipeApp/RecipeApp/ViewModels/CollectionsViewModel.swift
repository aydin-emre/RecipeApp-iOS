//
//  CollectionsViewModel.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class CollectionsViewModel: BaseViewModel {

    let collections: PublishSubject<Collections> = PublishSubject()
    private let collectionsProtocol: CollectionsProtocol

    init(collectionsProtocol: CollectionsProtocol) {
        self.collectionsProtocol = collectionsProtocol
    }

    func requestData() {
        collectionsProtocol.getCollections { result in
            switch result {
            case .success(let response):
                self.collections.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

}
