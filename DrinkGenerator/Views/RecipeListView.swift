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
    
    var urlString: String {
        guard let firstBottle = homeBar.bottleList.first?.name else { return "Gin" }
        let urlBaseString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i="
        let searchTerm = String(firstBottle)
        return urlBaseString + searchTerm
    }
    
    lazy var drinks: [DrinkStub] = { CocktailAPI().decode(DrinkList.self, from: urlString).drinks.sorted()
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
            .environmentObject(HomeBar())
    }
}
