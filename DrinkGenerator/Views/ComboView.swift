//
//  ComboView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/22/21.
//

import SwiftUI

struct ComboView: View {
    var ingredients: [Bottle]
    
    //takenBy is temporarily hardcoded. Still deciding if this should be decided by the user or not
    var takenBy: Int = 3
    
    var randomCombo: [Bottle] { ComboGenerator().generateAllIngredientCombos(ingredients: ingredients, takenBy: takenBy).randomElement()!
    }
        
    var body: some View {
        VStack {
            Section {
                Text("Try this out:")
                    .bold()
                    .font(.title2)
            }
            
            Section {
                ForEach(randomCombo) { item in
                    Text(item.name)
                }
            }
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
    }
}

struct ComboView_Previews: PreviewProvider {
    static var previews: some View {
        ComboView(ingredients: [Bottle.example1, Bottle.example2, Bottle.example3, Bottle.example4])
    }
}
