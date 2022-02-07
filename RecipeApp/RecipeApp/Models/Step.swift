//
//  Step.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation

struct Step: Decodable {

    let stepDescription: String?
    let imageUrls: [String]?

    enum CodingKeys: String, CodingKey {
        case stepDescription = "description"
        case imageUrls = "image_urls"
    }

}
