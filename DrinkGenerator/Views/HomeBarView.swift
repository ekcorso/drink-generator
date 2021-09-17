//
//  HomeBarView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 9/14/21.
//

import SwiftUI

struct HomeBarView: View {
    @EnvironmentObject var homeBar: HomeBar
    var ingredients: [Bottle] {
        Array(homeBar.bottleList)
    }
    //var homeBarIsEmpty: Bool = false
    var homeBarIsEmpty: Bool {
        if homeBar.bottleList.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            if homeBarIsEmpty {
                Text("Home bar is empty")
                    .navigationTitle("Home Bar")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        NavigationLink("Edit", destination: IngredientView())
                    }
            } else {
                VStack {
                    List {
                        Section(header: Text("Bottles in your home bar: ")) {
                            ForEach(ingredients) { bottle in
                                Text(bottle.name)
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationTitle("Home Bar")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        NavigationLink("Edit", destination: IngredientView())
                    }
                    
                    Text("Feeling adventurous? To get a randomly generated cocktail idea from your available ingredients, tap \"Combos\"! Or tap \"Recipes\" to get tried and true recipes you can make instead.")
                    Divider()
                }
            }
        }
    }
}

struct HomeBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBarView()
            .environmentObject(HomeBar())
    }
}
