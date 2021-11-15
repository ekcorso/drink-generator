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
    
//    let ingredients: [String]
//        //= [detailedRecipe.strIngredient1]
//
//    init(recipe: DrinkStub) {
//        ingredients = [detailedRecipe.strIngredient1!]
//        self.recipe = recipe
//    }
        
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
