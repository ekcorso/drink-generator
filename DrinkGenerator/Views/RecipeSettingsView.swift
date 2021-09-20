//
//  RecipeSettingsView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 9/19/21.
//

import SwiftUI

struct RecipeSettingsView: View {
    @EnvironmentObject var homeBar: HomeBar
    var bottles: [Bottle] {
        Array(homeBar.bottleList)
    }
    @State private var selectedBottle = Set<Bottle>()
    
    //This is currently unused
    @State private var wantsRandomRecipes: Bool = false

    
    var body: some View {
        Form {
            Section(header: Text("Which ingredient would you like to see recipes containing?")) {
                Picker("Bottles", selection: $selectedBottle) {
                    ForEach(bottles, id: \.self) {
                        Text($0.name)
                    }
                }
            }
            Section(header: Text("Add bottles to your home bar")) {
                NavigationLink(destination: IngredientView()) {
                    Text("View your home bar")
                }
            }
            Section(header: Text("Show me recipes from a random ingredient")) {
                Toggle("Random", isOn: $wantsRandomRecipes)
            }
        }
    }
}

struct RecipeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSettingsView()
            .environmentObject(HomeBar())
    }
}
