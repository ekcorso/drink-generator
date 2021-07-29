//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
    let bottles: IngredientList = {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
        let cocktailAPI = CocktailAPI()
        let ingredientList = cocktailAPI.decode(IngredientList.self, from: urlString)
        
        return ingredientList
    }()
    
    @State private var bottle = ""
    @State private var bottlesSelected = ["gin", "rum", "amaro", "lime juice", "demerera syrup"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("First select the cocktail ingredients you have on hand")) {
                    List {
//                        ForEach(bottles, id: \.self) {
//                            Text("\($0.name)")
//                            //Add subtitle with category?
//                        }
                    }
                }
//                Section(header: Text("First, what cocktail ingredients do you have on hand?")) {
//                    TextField("Enter your bottles here", text: $bottle)
//                    HStack {
//                        Spacer()
//                        Button("Add Ingredient") {
//                            bottlesSelected.append(bottle)
//                            bottle = ""
//                        }
//                        Spacer()
//                    }
//                }
                Section(header: Text("Your bar so far...")) {
                    List {
                        ForEach(bottlesSelected, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .toolbar {
                        EditButton()
                    }
                }
                Section(header: Text("Next you'll need to categorize these options...")) {
                    HStack {
                        Spacer()
                        Button("Let's go!") {
                            //Hook up button action here
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("Cocktail Generator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
