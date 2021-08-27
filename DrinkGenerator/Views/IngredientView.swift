//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI

struct IngredientView: View {
    @State private var multiSelection = HomeBar()

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
            
    func printSelectedBottles(selections: Set<UUID>, bottles: [Bottle]) {
        for selection in selections {
            for bottle in bottles {
                if bottle.id == selection {
                    print(bottle.name)
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    Text(multiSelection.bottleList.count == 0 ? "Select up to 10" : "\(multiSelection.bottleList.count) items selected")
                 }
                Section {
                    Button("Print selected") { printSelectedBottles(selections: multiSelection.bottleList, bottles: bottles)
                    }
                }
                Section {
                    List(selection: $multiSelection.bottleList) {
                        ForEach(bottles, id: \.id) { item in
                            Text(item.name)
                        }
                    }
                }
                .toolbar {
                    EditButton()
                }
            }
            .navigationTitle("Cocktail Ingredients")
//            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
