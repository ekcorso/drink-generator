//
//  CocktailAPI.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

struct CocktailAPI {
    var homeBar: HomeBar
    
    var urlString: String {
        // TODO: Guard statement needs to handle the case where bottleList is empty
        guard let firstBottle = homeBar.bottleList.first?.name else { return "Gin" }
        let urlBaseString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i="
        // TODO: Be sure to convert searchTerm to snakecase before trying to use it
        let searchTerm = String(firstBottle)
        return urlBaseString + searchTerm
    }
    
    init(homeBar: HomeBar) {
        self.homeBar = homeBar
    }
    
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
