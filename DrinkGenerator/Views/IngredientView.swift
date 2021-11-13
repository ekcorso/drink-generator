//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI

struct IngredientView: View {
    @EnvironmentObject var homeBar: HomeBar
    
    var bottles: [Bottle] {
        return homeBar.allIngredients ?? [Bottle]()
    }
    
    var filteredBottles: [Bottle] {
        return Array(Set(bottles).subtracting(homeBar.bottleList)).sorted()
    }
    
    @State private var selectedBottleIds = Set<UUID>()
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    List(filteredBottles, selection: $selectedBottleIds) { bottle in
                        Text(bottle.name)
                    }
                }
                .toolbar {
                    EditButton()
                }
            }
            .navigationTitle("Cocktail Ingredients")
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear {
                homeBar.add(selectedBottleIds, from: bottles)
            }
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
            .environmentObject(HomeBar())
    }
}
