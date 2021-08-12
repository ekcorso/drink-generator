//
//  RecipeRow.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/10/21.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: DrinkStub
    
    var body: some View {
        HStack {
            ImageView(withURL: recipe.strDrinkThumb)
            
            VStack(alignment: .center) {
                NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                    Text(recipe.strDrink)
                }
                .padding()
            }
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: DrinkStub.example)
    }
}
