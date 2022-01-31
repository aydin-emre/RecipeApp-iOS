//
//  RecipesTests.swift
//  RecipeAppTests
//
//  Created by Emre on 30.01.2022.
//

import XCTest
import RxSwift
import RxCocoa
@testable import RecipeApp

class RecipesTests: XCTestCase {

    private var localRecipesRepository: LocalRecipesRepository!
    private var recipesViewModel: RecipesViewModel!
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        localRecipesRepository = LocalRecipesRepository()
        recipesViewModel = RecipesViewModel(recipesProtocol: localRecipesRepository)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        localRecipesRepository = nil
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
                XCTAssertEqual(firstRecipe?.id, 3106180)
                XCTAssertEqual(firstRecipe?.title, "Mini olive pies by Vaggelio")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
    }

}
