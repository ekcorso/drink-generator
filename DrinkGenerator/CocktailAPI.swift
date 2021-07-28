//
//  CocktailAPI.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

class CocktailAPI {
    func parseIngredients(from data: Data) {
        let decoder = JSONDecoder()
        
        if let ingredientArray = try? decoder.decode(IngredientList.self, from: data) {
            for item in ingredientArray.drinks {
                // create an array of item.stringIngredient1 or skip this for loop and do something with the whole array this returns
            }
        }
    }
    
    func fetchIngredients() {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
        
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            parseIngredients(from: data)
            return
        }
    }
}
