//
//  BundleExtension.swift
//  RecipeApp
//
//  Created by Emre on 30.01.2022.
//

import Foundation

extension Bundle {

    func decode<T: Decodable>(fromJSON fileName: String, of type: T.Type) -> T? {
        guard let url = self.url(forResource: fileName, withExtension: "json") else {
            print("Failed to locate \(fileName) in bundle.")
            return nil
        }

        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load \(fileName) from bundle.")
            return nil
        }

        guard let t = try? JSONDecoder().decode(T.self, from: data) else {
            print("Failed to decode \(fileName) from bundle.")
            return nil
        }

        return t
    }

}
