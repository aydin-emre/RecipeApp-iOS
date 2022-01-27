//
//  Recipe.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation

struct Recipe: Codable {

    let id: Int
    let title, story: String
    let imageURL: String?
    let publishedAt: String
    let user: User
    let ingredients: [String]
    let steps: [Step]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case story
        case imageURL = "image_url"
        case publishedAt = "published_at"
        case user
        case ingredients
        case steps
    }

}

typealias Recipes = [Recipe]