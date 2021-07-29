//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
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
                Section(header: Text("First select the cocktail ingredients you have on hand")) {
                    List {
                        ForEach(bottles.sorted(), id: \.self) {
                            Text("\($0.capitalized)")
                            //Add subtitle with category?
                        }
                        HStack {
                            Spacer()
                            Button("Add Ingredient") {
                                bottlesSelected.append(bottle)
                                bottle = ""
                            }
                            Spacer()
                        }
                    }
                }
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
