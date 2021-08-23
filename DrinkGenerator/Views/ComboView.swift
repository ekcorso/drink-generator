//
//  ComboView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/22/21.
//

import SwiftUI

struct ComboView: View {
    @EnvironmentObject var ingredients: [Bottle]
    
    //takenBy is temporarily hardcoded. Still deciding if this should be decided by the user or not
    var takenBy: Int = 3
    
    var allCombos: [[Bottle]] { ComboGenerator().generateAllIngredientCombos(ingredients: ingredients, takenBy: takenBy)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ComboView_Previews: PreviewProvider {
    static var previews: some View {
        ComboView()
            //.environmentObject([Bottle.example])
    }
}
