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
    @State private var showingSettingsSheet = false

     var drinks: [DrinkStub] { CocktailAPI(requestType: .drinkStubList, homeBar: homeBar).fetchDrinks()
     }
      
    var body: some View {
        NavigationView {
            Section {
                List(drinks, id: \.id) { drink in
                    RecipeRow(recipe: drink)
                }
            }
            .navigationTitle("Tried & True Cocktail Recipes")
            .toolbar {
                ToolbarItem {
                    Button("Settings") {
                        showingSettingsSheet.toggle()
                    }
                    .sheet(isPresented: $showingSettingsSheet) {
                        RecipeSettingsView()
                    }
                }
            }
        }
    }
}

struct CDBRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(HomeBar())
    }
}
