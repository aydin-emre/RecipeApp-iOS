//
//  Collection.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation

typealias Collections = [Collection]

struct Collection: Codable {

    let id: Int?
    let title: String?
    let collectionDescription: String?
    let recipeCount: Int?
    let previewImageUrls: [String]?

    enum CodingKeys: String, CodingKey {
        case id, title
        case collectionDescription = "description"
        case recipeCount = "recipe_count"
        case previewImageUrls = "preview_image_urls"
    }

}
