//
//  HomeBarView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 9/14/21.
//

import SwiftUI

struct HomeBarView: View {
    @EnvironmentObject var homeBar: HomeBar
    @State private var showingSheet = false
    
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
                        }
                    }
                    .listStyle(GroupedListStyle())
                    NavigationLink("Add more bottles", destination: IngredientView())
                        .padding(10)
                        .background(Color(.systemOrange))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                    Button("Print List") {
                        for bottle in Array(homeBar.bottleList) {
                            print(bottle.name)
                        }
                    }
                    .padding(10)
                    .background(Color(.systemPink))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    Divider()
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
