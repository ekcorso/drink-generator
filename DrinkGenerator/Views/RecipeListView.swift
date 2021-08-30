//
//  RecipeListView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/6/21.
//

import SwiftUI

struct RecipeListView: View {
    @State private var selection = UUID()
    @State private var sampleHomeBar = HomeBar()
    var homeBarBottles = ["Gin", "Dry Vermouth"]
    
    let drinks: [DrinkStub] = {
        let urlBaseString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i="
        let urlSearchTerms = "Dry_Vermouth,Gin"
        let urlString = urlBaseString + urlSearchTerms
        let cocktailAPI = CocktailAPI()
        let drinks: [DrinkStub] = cocktailAPI.decode(DrinkList.self, from: urlString).drinks
        
        return drinks.sorted()
    }()
    
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
    }
}
