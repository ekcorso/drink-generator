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
    @State private var selectedBottle = Bottle(name: "Random")
    //This is currently unused
    @State private var wantsRandomRecipes: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Which ingredient would you like to see recipes containing?")) {
                    Picker("Bottles", selection: $selectedBottle) {
                        ForEach(bottles, id: \.self) {
                            Text($0.name)
                        }
                    }
                    .onChange(of: selectedBottle) { value in
                        self.homeBar.setSelectedBottle(bottle: selectedBottle)
                    }
                }
                Section(header: Text("Add bottles to your home bar")) {
                    NavigationLink(destination: IngredientView()) {
                        Text("Select Ingredients")
                    }
                }
                Section(header: Text("Show me recipes from a random ingredient")) {
                    Toggle("Random", isOn: $wantsRandomRecipes)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if let selectedBottle = homeBar.selectedBottle {
                    self.selectedBottle = selectedBottle
                }
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
