//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("First, please select up to 10 bottles that you'd like to find cocktails with")
                
                Section(header: Text("Add bottles from your home bar")) {
                    NavigationLink(destination: IngredientView()) {
                        Text("Select bottles")
                    }
                }
                
                Section(header: Text("Ready to see some cocktail options?")) {
                    
                    NavigationLink(destination: ComboView(ingredients: [Bottle.example1, Bottle.example2, Bottle.example3, Bottle.example4])) {
                            Text("Show me Mr. Potatohead-style recipe ideas")
                        }
                    
                    NavigationLink(destination: RecipeListView()) {
                        Text("Show me tried and true recipes")
                    }
                    
                }
            }
            .navigationTitle("Cocktail Generator")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HomeBar())
    }
}
