//
//  RecipeListView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/6/21.
//

import SwiftUI

struct RecipeListView: View {
    @State private var selection = UUID()
    @EnvironmentObject var homeBar: HomeBar

     var drinks: [DrinkStub] { CocktailAPI(requestType: .drinkStubList, homeBar: homeBar, recipeId: nil).decode(DrinkList.self).drinks.sorted()
     }
      
    var body: some View {
        Section {
            List(drinks, id: \.id) { drink in
                RecipeRow(recipe: drink)
            }
        }
        .navigationTitle("Tried & True Cocktails")
    }
}

struct CDBRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(HomeBar())
    }
}
