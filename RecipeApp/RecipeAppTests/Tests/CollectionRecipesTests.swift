//
//  CollectionRecipesTests.swift
//  RecipeAppTests
//
//  Created by Emre Aydın on 31.01.2022.
//

import XCTest
import RxSwift
import RxCocoa
@testable import RecipeApp

class CollectionRecipesTests: XCTestCase {

    private var recipesViewModel: RecipesViewModel!
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        recipesViewModel = RecipesViewModel(recipesProtocol: LocalRecipesRepository(), collectionId: 1)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        recipesViewModel = nil
        disposeBag = nil
        try super.tearDownWithError()
    }

    func testFirstCollectionDecoding() throws {
        let expectation = expectation(description: "Service Call")
        defer {
            recipesViewModel.requestData()
            wait(for: [expectation], timeout: 1)
        }

        recipesViewModel
            .recipes
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { recipes in
                let firstRecipe = recipes.first
                XCTAssertEqual(firstRecipe?.id, 188350)
                XCTAssertEqual(firstRecipe?.title, "Seafood Ehomaki (Lucky Fat Sushi Rolls)")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
    }

}
