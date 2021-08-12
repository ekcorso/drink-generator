//
//  RecipeDetailView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/12/21.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: DrinkStub
    
    var body: some View {
        VStack {
            ImageView(withURL: recipe.strDrinkThumb)
            Text(recipe.strDrink)
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
