//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI

struct IngredientView: View {
    @EnvironmentObject var homeBar: HomeBar

    let bottles: [Bottle] = {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
        let cocktailAPI = CocktailAPI()
        let ingredients = cocktailAPI.decode(IngredientList.self, from: urlString).drinks
        
        var bottles = [Bottle]()
        for ingredient in ingredients {
            let bottleName = ingredient.strIngredient1
            bottles.append(Bottle(name: bottleName.capitalized, id: UUID()))
        }
        
        return bottles.sorted()
    }()
    
    @State private var selectedBottleIds = Set<UUID>()
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    Text(selectedBottleIds.count == 0 ? "Select up to 10" : "\(selectedBottleIds.count) items selected")
                }
                Section {
                    Button("Print selected") {
                        print("Homebar bottles:")
                        for bottle in homeBar.bottleList {
                            print(bottle.name)
                        }
                        print("Selector bottles:")
                        for bottle in bottles {
                            for id in selectedBottleIds {
                                if bottle.id == id {
                                    print(bottle.name)
                                }
                            }
                        }
                    }
                }
                Section {
                    List(bottles, selection: $selectedBottleIds) { bottle in
                        Text(bottle.name)
                    }
                    .onChange(of: selectedBottleIds) { value in
                        homeBar.update(selectedBottleIds, from: bottles)
                    }
                }
                .toolbar {
                    EditButton()
                }
            }
            .navigationTitle("Cocktail Ingredients")
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
            .environmentObject(HomeBar())
    }
}
