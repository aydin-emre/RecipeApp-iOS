//
//  RecipesTests.swift
//  RecipeAppTests
//
//  Created by Emre on 30.01.2022.
//

import XCTest
@testable import RecipeApp

class RecipesTests: XCTestCase {

    var recipes: Recipes?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let bundle = Bundle(for: type(of: self))
        recipes = bundle.decode(fromJSON: "Recipes", of: Recipes.self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        recipes = nil
        try super.tearDownWithError()
    }

    func testFirstRecipeDecoding() throws {
        let firstRecipe = recipes?.first
        XCTAssertEqual(firstRecipe?.id, 3106180)
        XCTAssertEqual(firstRecipe?.title, "Mini olive pies by Vaggelio")
    }

    func testLastRecipeDecoding() throws {
        let lastRecipe = recipes?.last
        XCTAssertEqual(lastRecipe?.id, 11385307)
        XCTAssertEqual(lastRecipe?.title, "How to Cook a Perfect Fried Egg")
    }

}
