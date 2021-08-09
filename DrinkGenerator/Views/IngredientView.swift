//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI

struct IngredientView: View {
    let bottles: [Bottle] = {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
        let cocktailAPI = CocktailAPI()
        let ingredients = cocktailAPI.decode(IngredientList.self, from: urlString).drinks
        
        var bottles = [Bottle]()
        for ingredient in ingredients {
            let bottleName = ingredient.strIngredient1
            bottles.append(Bottle(name: bottleName.capitalized))
        }
        
        return bottles.sorted()
    }()
    
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    Text(multiSelection.count == 0 ? "Select up to 10" : "\(multiSelection.count) items selected")
                 }
                Section {
                    List(bottles, selection: $multiSelection) {
                        Text($0.name)
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
