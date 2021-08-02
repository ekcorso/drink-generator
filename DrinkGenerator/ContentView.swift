//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
    let bottles: [Bottle] = {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
        let cocktailAPI = CocktailAPI()
        let drinks = cocktailAPI.decode(IngredientList.self, from: urlString).drinks
        
        var bottles = [Bottle]()
        for drink in drinks {
            let bottleName = drink.strIngredient1
            bottles.append(Bottle(name: bottleName.capitalized))
        }
                
        return bottles.sorted()
    }()
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationView {
            Section {
                //Text("Tap to select the cocktail ingredients you have on hand")
                List(bottles, selection: $multiSelection) {
                    Text($0.name)
                }
                .navigationTitle("\(multiSelection.count) Ingredients Selected")
                .toolbar {
                    EditButton()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
