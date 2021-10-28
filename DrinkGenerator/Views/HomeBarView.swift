//
//  HomeBarView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 9/14/21.
//

import SwiftUI

struct HomeBarView: View {
    @EnvironmentObject var homeBar: HomeBar
        
    var body: some View {
        NavigationView {
            if homeBar.bottleList.isEmpty {
                VStack {
                    Text("Your home bar is empty.")
                    Text("Let's fix that...")
                    Divider()
                    NavigationLink("Select some ingredients", destination: IngredientView())
                        .padding(10)
                        .background(Color(.systemOrange))
                        .foregroundColor(Color(.systemGray6))
                        .clipShape(Capsule())
                }
                .navigationTitle("Home Bar")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                VStack {
                    List {
                        Section(header: Text("Bottles in your home bar: ")) {
                            ForEach(Array(homeBar.bottleList)) { bottle in
                                Text(bottle.name)
                            }
                            .onDelete(perform: { indexSet in
                                        homeBar.delete(indexSet, from: Array(homeBar.bottleList))
                            })
                        }
                    }
                    .listStyle(GroupedListStyle())
                    NavigationLink("Add more bottles", destination: IngredientView())
                        .padding(10)
                        .background(Color(.systemOrange))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                    Text("Feeling adventurous? To get a randomly generated cocktail idea from your available ingredients, tap \"Combos\"! Or tap \"Recipes\" to get tried and true recipes you can make instead.")
                    Divider()
                }
                .toolbar {
                    EditButton()
                }
                .navigationTitle("Home Bar")
                .navigationBarTitleDisplayMode(.inline)
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
