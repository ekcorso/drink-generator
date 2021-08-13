//
//  Recipe.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/8/21.
//

import Foundation

struct RecipeList: Codable {
    let drinks: [Recipe]
}

struct Recipe: Codable {
    let strDrink: String
    let idDrink: String
    
    let strGlass: String
    
    //Should the drink thumbnail be a URL or an image? it would need to fetch the image from the url in order to load it
    let strDrinkThumb: String
    
    let strInstructions: String
    
    //Ingredients and Measures can be null, so they are optionals
    
//    let strIngredient1: String
//    let strIngredient2: String
//    let strIngredient3: String
//    let strIngredient4: String
//    let strIngredient5: String
//    let strIngredient6: String
//    let strIngredient7: String
//    let strIngredient8: String
//    let strIngredient9: String
//    let strIngredient10: String
//    let strIngredient11: String
//    let strIngredient12: String
//    let strIngredient13: String
//    let strIngredient14: String
//    let strIngredient15: String
//    
//    let strMeasure1: String
//    let strMeasure2: String
//    let strMeasure3: String
//    let strMeasure4: String
//    let strMeasure5: String
//    let strMeasure6: String
//    let strMeasure7: String
//    let strMeasure8: String
//    let strMeasure9: String
//    let strMeasure10: String
//    let strMeasure11: String
//    let strMeasure12: String
//    let strMeasure13: String
//    let strMeasure14: String
//    let strMeasure15: String
}

extension Recipe: Identifiable {
    var id: Int { return Int(idDrink)! }
}

extension Recipe: Comparable {
    static func < (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.strDrink < rhs.strDrink
    }
}
