//
//  Constants.swift
//  RecipeApp
//
//  Created by Emre on 25.01.2022.
//

import UIKit

enum NetworkPath {
    static let baseURL: String = "https://cookpad.github.io/global-mobile-hiring/api/"
    static let allCollectionsPath = "collections/"
    static let allRecipesPath = "recipes/"
    static let collectionRecipesPath = "collections/%@/recipes"
}

enum Color {
    static let appColor = UIColor(red: 242/255.0, green: 157/255.0, blue: 75/255.0, alpha: 1)
    static let lightGrayColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1)
}
