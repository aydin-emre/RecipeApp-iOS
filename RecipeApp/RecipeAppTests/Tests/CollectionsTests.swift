//
//  CollectionsTests.swift
//  RecipeAppTests
//
//  Created by Emre on 30.01.2022.
//

import XCTest
import RxSwift
import RxCocoa
@testable import RecipeApp

class CollectionsTests: XCTestCase {

    private var localCollectionsRepository: LocalCollectionsRepository!
    private var collectionsViewModel: CollectionsViewModel!
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        localCollectionsRepository = LocalCollectionsRepository()
        collectionsViewModel = CollectionsViewModel(collectionsProtocol: localCollectionsRepository)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        localCollectionsRepository = nil
        collectionsViewModel = nil
        disposeBag = nil
        try super.tearDownWithError()
    }

    func testFirstCollectionDecoding() throws {
        let expectation = expectation(description: "Service Call")
        defer {
            collectionsViewModel.requestData()
            wait(for: [expectation], timeout: 1)
        }

        collectionsViewModel
            .collections
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { collections in
                let firstCollection = collections.first
                XCTAssertEqual(firstCollection?.title, "Taste of Japan 🇯🇵")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
    }

}
