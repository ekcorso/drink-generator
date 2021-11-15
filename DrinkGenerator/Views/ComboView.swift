//
//  ComboView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/22/21.
//

import SwiftUI
import Combinatorics

struct ComboView: View {
    @EnvironmentObject var homeBar: HomeBar
    var ingredients: [Bottle] {
        Array(homeBar.bottleList)
    }
    var takenBy: Int = 3
    @State private var randomCombo = [Bottle]()
    
    var body: some View {
        if ingredients.count >= takenBy {
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
                            randomCombo = Combination(of: ingredients, size: takenBy).map { $0 }.randomElement() ?? [Bottle]()
                        }
                        .padding()
                        .background(Color(.blue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                }
                .navigationTitle("Combos")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    randomCombo =  Combination(of: ingredients, size: takenBy).map { $0 }.randomElement() ?? [Bottle]()
                }
            }
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
        ComboView()
            .environmentObject(HomeBar())
    }
}
