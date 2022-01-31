//
//  Constants.swift
//  RecipeApp
//
//  Created by Emre on 25.01.2022.
//

import UIKit

let appColor = UIColor(red: 242/255.0, green: 157/255.0, blue: 75/255.0, alpha: 1)
let lightGrayColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1)

enum NetworkPath: String {
    case allCollectionsPath = "collections/"
    case allRecipesPath = "recipes/"
    case collectionRecipesPath = "collections/%@/recipes"
}
