//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI

struct IngredientView: View {
    @State private var homeBar = HomeBar()

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
                    Text(homeBar.bottleList.count == 0 ? "Select up to 10" : "\(homeBar.bottleList.count) items selected")
                 }
                Section {
                    Button("Print selected") { printSelectedBottles(selections: homeBar.bottleList, bottles: bottles)
                    }
                }
                Section {
                    List(selection: $homeBar.bottleList) {
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
