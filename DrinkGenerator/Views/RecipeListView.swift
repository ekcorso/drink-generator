//
//  RecipeListView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/6/21.
//

import SwiftUI

struct RecipeListView: View {
    @State private var selection = UUID()
    
    let drinks: [DrinkStub] = {
        // TODO: break this url into base + search params. This URL is currently hardcoded to show stubs for recipes with Dry Vermouth and Gin
        let urlString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Dry_Vermouth,Gin"
        let cocktailAPI = CocktailAPI()
        let drinks: [DrinkStub] = cocktailAPI.decode(DrinkList.self, from: urlString).drinks
        
        return drinks.sorted()
    }()
    
    var body: some View {
        NavigationView {
            Section {
                List(drinks, id: \.id) { drink in
                    RecipeRow(recipe: drink)
                }
            }
            .navigationTitle("Tried & True Cocktails")
        }
    }
}

struct CDBRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
