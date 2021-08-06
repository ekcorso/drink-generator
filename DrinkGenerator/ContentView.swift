//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose bottles")) {
                    NavigationLink(destination: IngredientView()) {
                        Text("Select bottles")
                    }
                }
                Section(header: Text("Ready to see some cocktail ideas?")) {
                    
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
