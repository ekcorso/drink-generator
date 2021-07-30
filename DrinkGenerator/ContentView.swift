//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String?
    let bottles: [String] = {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
        let cocktailAPI = CocktailAPI()
        let drinks = cocktailAPI.decode(IngredientList.self, from: urlString).drinks
        
        var bottles = [String]()
        for drink in drinks {
            let strBottle = drink.strIngredient1
            bottles.append(strBottle)
        }
        
        return bottles
    }()
    
    @State private var bottle = ""
    @State private var bottlesSelected = ["gin", "rum", "amaro", "lime juice", "demerera syrup"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Tap to select the cocktail ingredients you have on hand")) {
                    //Add a sub-header that indicates a selection limit of 10 ingredients
                    List(bottles.sorted(), id: \.self, selection: $selection) { bottle in
                        CheckView(isChecked: false, title: bottle.capitalized)
                    }
                }
//                Section(header: Text("Your bar so far...")) {
//                    List {
//                        ForEach(bottlesSelected, id: \.self) {
//                            Text("\($0)")
//                        }
//                    }
//                }
            }
            .navigationTitle("Cocktail Generator")
            .toolbar {
                EditButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
