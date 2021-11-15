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
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    
    static let example = Recipe(strDrink: "Margarita", idDrink: "11007", strGlass: "Cocktail glass", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", strIngredient1: "Tequila", strIngredient2: "Triple sec", strIngredient3: "Lime juice", strIngredient4: "Salt", strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strMeasure1: "1 1/2 oz ", strMeasure2: "1/2 oz ", strMeasure3: "1 oz ", strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil)
}

extension Recipe: Identifiable {
    var id: Int { return Int(idDrink)! }
}

extension Recipe: Comparable {
    static func < (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.strDrink < rhs.strDrink
    }
}
