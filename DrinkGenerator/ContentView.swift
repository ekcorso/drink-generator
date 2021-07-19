//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var bottle = ""
    var bottles = ["gin", "rum", "amaro", "lime juice", "demerera syrup"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("First, what cocktail ingredients do you have on hand?")) {
                    TextField("Enter your bottles here", text: $bottle)
                }
                Section(header: Text("Your bar so far...")) {
                    List {
                        ForEach(bottles, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .toolbar {
                        EditButton()
                    }
                }
                Section {
                    HStack {
                        Text("Next we'll need to categorize these options.")
                            .foregroundColor(Color.white)
                            
                    Button("Let's go") {
                        
                    }
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
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
