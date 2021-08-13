//
//  RecipeDetailView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/12/21.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: DrinkStub

    let detailedRecipe: Recipe = {
        let urlStringBase = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
        //recipeIdString is hardcoded for the Tuxedo Cocktail, but should be based on the id of the recipe being passed in
        let recipeIdString = String(12420)
        let urlString = urlStringBase + recipeIdString
        let cocktailAPI = CocktailAPI()
        let recipes: [Recipe] = cocktailAPI.decode(RecipeList.self, from: urlString).drinks
        
        return recipes[0]
    }()
        
    var body: some View {
        VStack {
            ImageView(withURL: detailedRecipe.strDrinkThumb)
            Text(detailedRecipe.strDrink)
            Text("""
Drink recipe instructions go here.
They could be several lines.
Like, lots of lines.
So many ingredients...
Hell, this could be a recipe for a
Fino Countdown.
Let's make sure there's room for some tasty drinks.
""")
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: DrinkStub.example)
    }
}
