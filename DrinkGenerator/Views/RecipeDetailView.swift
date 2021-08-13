//
//  RecipeDetailView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/12/21.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: DrinkStub
    
    var detailedRecipe: Recipe {
        let urlStringBase = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
        let recipeIdString = String(recipe.id)
        let urlString: String = urlStringBase + recipeIdString
        let cocktailAPI = CocktailAPI()
        let recipes: [Recipe] = cocktailAPI.decode(RecipeList.self, from: urlString).drinks
        
        return recipes[0]
    }
        
    var body: some View {
        VStack {
            ImageView(withURL: detailedRecipe.strDrinkThumb)
            Divider()
            Text(detailedRecipe.strDrink)
                .font(.title2)
                .bold()
            Divider()
            Group {
                Text("Ingredients")
                    .bold()
                Divider()
            Text("""
                Base Liquor
                Some other liquor
                Why not amaro
                Citrus
                Bitters
                """)
            }
            //Divider()
            Text(detailedRecipe.strInstructions)
                .padding()
            Divider()
            Text("Recommended Glassware: \(detailedRecipe.strGlass)")
                .italic()
                .frame(alignment: .leading)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: DrinkStub.example)
    }
}
