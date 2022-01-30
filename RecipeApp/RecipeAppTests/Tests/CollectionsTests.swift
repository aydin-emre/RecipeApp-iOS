//
//  CollectionsTests.swift
//  RecipeAppTests
//
//  Created by Emre on 30.01.2022.
//

import XCTest
@testable import RecipeApp

class CollectionsTests: XCTestCase {

    var collections: Collections?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let bundle = Bundle(for: type(of: self))
        collections = bundle.decode(fromJSON: "Collections", of: Collections.self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        collections = nil
        try super.tearDownWithError()
    }

    func testFirstCollectionDecoding() throws {
        let firstCollection = collections?.first
        XCTAssertEqual(firstCollection?.title, "Taste of Japan 🇯🇵")
        XCTAssertEqual(firstCollection?.recipeCount, 19)
        XCTAssertEqual(firstCollection?.previewImageUrls?.count, 4)
    }

    func testLastCollectionDecoding() throws {
        let lastCollection = collections?.last
        XCTAssertEqual(lastCollection?.title, "Top Picks 🥇")
        XCTAssertEqual(lastCollection?.recipeCount, 19)
        XCTAssertEqual(lastCollection?.previewImageUrls?.count, 4)
    }

}
