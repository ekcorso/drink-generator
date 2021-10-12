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
    
    var drinksIsEmpty: Bool {
        if drinks.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            if drinksIsEmpty {
                VStack {
                    Text("""
                        That search didn't return any recipes 🤔
                        
                        To fix that, tap settings to update your home bar ingredients or search selections.
                        """)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                }
                .navigationTitle("Recipes")
                .navigationBarTitleDisplayMode(.inline)
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
            } else {
                Section {
                    List(drinks, id: \.id) { drink in
                        RecipeRow(recipe: drink)
                    }
                }
                .navigationTitle("Recipes")
                .navigationBarTitleDisplayMode(.inline)
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
}

struct CDBRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(HomeBar())
    }
}
