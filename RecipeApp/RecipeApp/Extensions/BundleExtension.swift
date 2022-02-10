//
//  BundleExtension.swift
//  RecipeApp
//
//  Created by Emre on 30.01.2022.
//

import Foundation

extension Bundle {

    func decode<T: Decodable>(fromJSON fileName: String, of type: T.Type) -> T {
        guard let url = self.url(forResource: fileName, withExtension: "json") else {
            fatalError("Failed to locate \(fileName) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName) from bundle.")
        }

        guard let t = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(fileName) from bundle.")
        }

        return t
    }

}
