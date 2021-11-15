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
        return CocktailAPI(requestType: .recipeDetail, recipeId: recipe.id).fetchRecipe()
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
                ReceipeTextView(detailedRecipe: detailedRecipe)
            }
            Text(detailedRecipe.strInstructions)
                .padding()
            Divider()
            Text("Serve in a \(detailedRecipe.strGlass.lowercased())")
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
