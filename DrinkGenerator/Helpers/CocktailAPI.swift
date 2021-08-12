//
//  CocktailAPI.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

struct CocktailAPI {
    func decode<T:Decodable>(_ type: T.Type, from urlString: String) -> T {
        guard let url = URL(string: urlString) else {
            fatalError("Failed to cast urlString as url.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from url.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data.")

        }

        return loaded
    }
}
