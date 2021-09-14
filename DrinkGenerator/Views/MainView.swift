//
//  MainView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 9/14/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            IngredientView()
                .tabItem {
                    Label("Ingredients", systemImage: "list")
                }
            HomeBarView()
                .tabItem {
                    Label("Home Bar", systemImage: "house")
                }
            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet.rectangle")
                }
            ComboView()
                .tabItem {
                    Label("Combos", systemImage: "bolt")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(HomeBar())
    }
}
