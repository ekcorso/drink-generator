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
                    \(detailedRecipe.strMeasure1 ?? "") \(detailedRecipe.strIngredient1 ?? "Jello")
                    \(detailedRecipe.strMeasure2 ?? "") \(detailedRecipe.strIngredient2 ?? "Soup")
                    \(detailedRecipe.strMeasure3 ?? "") \(detailedRecipe.strIngredient3 ?? "Mayo")
                    \(detailedRecipe.strMeasure4 ?? "") \(detailedRecipe.strIngredient4 ?? "Armadillos")
                    \(detailedRecipe.strMeasure5 ?? "") \(detailedRecipe.strIngredient5 ?? "Sawdust")
                    \(detailedRecipe.strMeasure6 ?? "") \(detailedRecipe.strIngredient6 ?? "Coffee Grounds")
                    \(detailedRecipe.strMeasure7 ?? "") \(detailedRecipe.strIngredient7 ?? "Weasles")
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
