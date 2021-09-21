//
//  CocktailAPI.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

//This is a test comment to see how git revert works

struct CocktailAPI {
    private var requestType: RequestType
    private var homeBar: HomeBar?
    private var recipeId: Int?
    
    private var urlString: String {
        switch requestType {
        case .drinkStubList:
            return buildDrinkStubListUrl(with: homeBar)
        case .recipeDetail:
            return buildRecipeDetailUrl(recipeId: recipeId)
        case .ingredientList:
            return "https://www.thecocktaildb.com/api/json/v2/9973533/list.php?i=list"
        }
    }
    
    init(requestType: RequestType) {
        self.requestType = requestType
    }
    
    init(requestType: RequestType, homeBar: HomeBar) {
        self.init(requestType: requestType)
        self.homeBar = homeBar
    }
    
    init(requestType: RequestType, recipeId: Int) {
        self.init(requestType: requestType)
        self.recipeId = recipeId
    }
    
    //DrinkStubList (aka RecipeListView's result)
    private func buildDrinkStubListUrl(with homeBar: HomeBar?) -> String {
        let urlBaseString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i="
        guard let homeBar = homeBar else {
            // TODO: handle this
            return "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Gin"
        }
        
        if homeBar.bottleList.isEmpty {
            // TODO: handle this
            return "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Gin"
        } else if homeBar.bottleList.count == 1 {
            let firstBottle = homeBar.bottleList.first!.snakeName
            let searchTerm = String(firstBottle)
            return urlBaseString + searchTerm
        } else {
            let bottles: [Bottle] = Array(homeBar.bottleList.shuffled().prefix(3))
            var searchTerms = [String]()
            for bottle in bottles {
                searchTerms.append(bottle.snakeName)
            }
            let combinedSearchTerms = searchTerms.joined(separator: ",")
            return urlBaseString + combinedSearchTerms
        }
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
            fatalError("Failed to decode data.")
            
        }
        return loaded.drinks.sorted()
    }
    
    func fetchIngredients() -> [Ingredient] {
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
        return loaded.drinks
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
}
