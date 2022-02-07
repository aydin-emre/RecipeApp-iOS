//
//  User.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation

struct User: Decodable {

    let name: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
    }

}
