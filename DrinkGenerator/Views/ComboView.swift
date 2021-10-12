//
//  ComboView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/22/21.
//

import SwiftUI

struct ComboView: View {
    @EnvironmentObject var homeBar: HomeBar
    var ingredients: [Bottle] {
        Array(homeBar.bottleList)
    }
    
    //takenBy is temporarily hardcoded. Still deciding if this should be decided by the user or not
    var takenBy: Int = 3
    
    var randomCombo: [Bottle] { ComboGenerator().generateAllIngredientCombos(ingredients: ingredients, takenBy: takenBy).randomElement()!
    }
    
    var body: some View {
        if ingredients.count > 3 {
            NavigationView {
                VStack(alignment: .center) {
                    Section {
                        Text("Try this out:")
                            .bold()
                            .font(.title2)
                    }
                    Divider()
                    Section {
                        ForEach(randomCombo) { item in
                            Text(item.name)
                        }
                    }
                    Divider()
                    Section {
                        Button("Generate new combo") {
                            //Needs to shuffle the allCombos array
                        }
                        .padding()
                        .background(Color(.blue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                }
                .navigationTitle("Combos")
                .navigationBarTitleDisplayMode(.inline)
            }
            //        ForEach(Array(zip(allCombos.indicies, allCombos
            //        )), id: \.0) { index, combo in
            //            Text("\(combo.description)")
            //        }
            //        Button("Print Combos") {
            //            for combo in allCombos.enumerated() {
            //                print(combo.element)
            ////                for item in combo {
            ////                    print(item.name)
            ////                }
            //            }
            //        }
        } else {
            NavigationView {
                Text("If you would like to generate combinations, please first select some bottles.")
                    .navigationTitle("Combos")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ComboView_Previews: PreviewProvider {
    static var previews: some View {
        //        ComboView(ingredients: [Bottle.example1, Bottle.example2, Bottle.example3, Bottle.example4])
        ComboView()
            .environmentObject(HomeBar())
    }
}
