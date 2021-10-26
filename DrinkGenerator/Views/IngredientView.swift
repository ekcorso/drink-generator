//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI

struct IngredientView: View {
    @EnvironmentObject var homeBar: HomeBar
    
    let bottles = CocktailAPI.ingredients
    
    @State private var selectedBottleIds = Set<UUID>()
    
    var body: some View {
        NavigationView {
            VStack {
//                Section {
//                    Text(selectedBottleIds.count == 0 ? "Select up to 10" : "\(selectedBottleIds.count) items selected")
//                }
//                Section {
//                    Button("Print selected") {
//                        print("Homebar bottles:")
//                        for bottle in homeBar.bottleList {
//                            print(bottle.name)
//                        }
//                        print("Selector bottles:")
//                        for bottle in bottles {
//                            for id in selectedBottleIds {
//                                if bottle.id == id {
//                                    print(bottle.name)
//                                }
//                            }
//                        }
//                    }
//                }
                Section {
                    List(bottles, selection: $selectedBottleIds) { bottle in
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
