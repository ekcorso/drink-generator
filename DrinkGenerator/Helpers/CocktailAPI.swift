//
//  CocktailAPI.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

struct CocktailAPI {
    var requestType: RequestType
    var homeBar: HomeBar?
    var recipeId: Int?
    
    var urlString: String {
        switch requestType {
        case .drinkStubList:
            return buildDrinkStubListUrl(with: homeBar)
        case .recipeDetail:
            return buildRecipeDetailUrl(recipeId: recipeId)
        case .ingredientList:
            return "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
        }
    }
    
    // Should this be a convenience init?
    init(requestType: RequestType, homeBar: HomeBar?, recipeId: Int?) {
        self.requestType = requestType
        self.homeBar = homeBar
        self.recipeId = recipeId
    }
    
    // T is a DrinkList, IngredientList, or RecipeList
    func decode<T:Decodable>(_ type: T.Type) -> T {
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
    
    //DrinkStubList (aka RecipeListView's result)
    func buildDrinkStubListUrl(with homeBar: HomeBar?) -> String {
        guard let homeBar = homeBar, let firstBottle = homeBar.bottleList.first?.name else { return "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Gin" }
        let urlBaseString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i="
        // TODO: Be sure to convert searchTerm to snakecase before trying to use it
        let searchTerm = String(firstBottle)
        return urlBaseString + searchTerm
    }
    
    //RecipeDetail
    func buildRecipeDetailUrl(recipeId: Int?) -> String {
        // TODO: Remove hardcoded ID and handle nil case
        guard let recipeId = recipeId else {
            return "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=12420"
        }
        let urlStringBase = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
        let recipeIdString = String(recipeId)
        return urlStringBase + recipeIdString
    }
    
    //Ingredients
    //This one is a static string "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
}
