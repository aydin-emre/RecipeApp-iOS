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

    public let collections: PublishSubject<Collections> = PublishSubject()
    public let error: PublishSubject<String> = PublishSubject()

    public func requestData() {
        NetworkManager.shared.getAllCollections { result in
            switch result {
            case .success(let response):
                self.collections.onNext(response)
            case .failure(let error):
                self.error.onNext(error.localizedDescription)
            }
        }
    }

}
