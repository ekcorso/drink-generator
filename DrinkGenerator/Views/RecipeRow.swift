//
//  RecipeRow.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/10/21.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: DrinkStub
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: DrinkStub.example)
    }
}
