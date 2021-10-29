//
//  CocktailAPI.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

struct CocktailAPI {
    private var requestType: RequestType
    private var homeBar: HomeBar?
    private var recipeId: Int?
    private var selectedBottle: Bottle?
    
    static var ingredients: [Bottle] {
        return CocktailAPI(requestType: .ingredientList).fetchIngredients()
    }
    
    private var urlString: String {
        switch requestType {
        case .drinkStubList:
            return buildDrinkStubListUrl(with: selectedBottle)
        case .recipeDetail:
            return buildRecipeDetailUrl(recipeId: recipeId)
        case .ingredientList:
            return "https://www.thecocktaildb.com/api/json/v2/9973533/list.php?i=list"
        }
    }
    
    init(requestType: RequestType) {
        self.requestType = requestType
    }
    
    init(requestType: RequestType, selectedBottle: Bottle?) {
        self.init(requestType: requestType)
        //self.homeBar = homeBar
        self.selectedBottle = selectedBottle
    }
    
    init(requestType: RequestType, recipeId: Int) {
        self.init(requestType: requestType)
        self.recipeId = recipeId
    }
    
    //DrinkStubList (aka RecipeListView's result)
    private func buildDrinkStubListUrl(with bottle: Bottle?) -> String {
        let urlBaseString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i="
//        guard let bottle = bottle else {
//            // TODO: handle this
//            return "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Gin"
//        }
        
        if let bottle = bottle {
            return urlBaseString + bottle.snakeName
        } else {
            return "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Gin"
        }
        
//        if homeBar.bottleList.isEmpty {
//            // TODO: handle this
//            return "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Gin"
//        } else if homeBar.bottleList.count == 1 {
//            let firstBottle = homeBar.bottleList.first!.snakeName
//            let searchTerm = String(firstBottle)
//            return urlBaseString + searchTerm
//        } else {
//            let bottles: [Bottle] = Array(homeBar.bottleList.shuffled().prefix(3))
//            var searchTerms = [String]()
//            for bottle in bottles {
//                searchTerms.append(bottle.snakeName)
//            }
//            let combinedSearchTerms = searchTerms.joined(separator: ",")
//            return urlBaseString + combinedSearchTerms
//        }
    }
    
    //RecipeDetail
    private func buildRecipeDetailUrl(recipeId: Int?) -> String {
        // TODO: Remove hardcoded ID and handle nil case
        guard let recipeId = recipeId else {
            return "https://www.thecocktaildb.com/api/json/v2/9973533/lookup.php?i=12420"
        }
        let urlStringBase = "https://www.thecocktaildb.com/api/json/v2/9973533/lookup.php?i="
        let recipeIdString = String(recipeId)
        return urlStringBase + recipeIdString
    }
    
    //Ingredients
    //This one is a static string "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
    
    func fetchDrinks() -> [DrinkStub] {
        guard let url = URL(string: urlString) else {
            fatalError("Failed to cast urlString as url.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from url.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(DrinkList.self, from: data) else {
            // This is where searches for bottle combos that don't have a result need to be handled
            return [DrinkStub]()
            fatalError("Failed to decode data.")
            
        }
        return loaded.drinks.sorted()
    }
    
    func fetchIngredients() -> [Bottle] {
        guard let url = URL(string: urlString) else {
            fatalError("Failed to cast urlString as url.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from url.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(IngredientList.self, from: data) else {
            fatalError("Failed to decode data.")
            
        }
        return convertIngredientsToBottles(ingredients: loaded.drinks)
    }
    
    func fetchRecipe() -> Recipe {
        guard let url = URL(string: urlString) else {
            fatalError("Failed to cast urlString as url.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from url.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(RecipeList.self, from: data) else {
            fatalError("Failed to decode data.")
            
        }
        return loaded.drinks[0]
    }
    
    private func convertIngredientsToBottles(ingredients: [Ingredient]) -> [Bottle] {        
        var bottles = [Bottle]()
        for ingredient in ingredients {
            let bottleName = ingredient.strIngredient1
            bottles.append(Bottle(name: bottleName.capitalized))
        }
        
        return bottles.sorted()
    }
}
