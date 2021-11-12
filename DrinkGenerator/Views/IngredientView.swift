//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI

struct IngredientView: View {
    @EnvironmentObject var homeBar: HomeBar
    
    var bottles: [Bottle] {
        return homeBar.allIngredients ?? [Bottle]()
    }
    
    var filteredBottles: [Bottle] {
        return Array(Set(bottles).subtracting(homeBar.bottleList)).sorted()
    }
    
    @State private var selectedBottleIds = Set<UUID>()
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    List(filteredBottles, selection: $selectedBottleIds) { bottle in
                        Text(bottle.name)
                    }
                }
                .toolbar {
                    EditButton()
                }
            }
            .navigationTitle("Cocktail Ingredients")
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear {
                homeBar.add(selectedBottleIds, from: bottles)
            }
        }
    }
    
    func save(_ ingredients: [Bottle]) throws {
        guard let encoded = try? JSONEncoder().encode(ingredients) else {
            print("encoding failed")
            DataPersistenceError.saveFailed
            return
        }
        
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent("ingredients.txt")
        
        do {
            try encoded.write(to: url)
        } catch {
            print("save failed")
        }
    }
    
    private func getIngredientsDataFromDirectory() -> [Bottle]? {
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent("ingredients.txt")
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedIngredients = try JSONDecoder().decode([Bottle].self, from: jsonData)
            print("getting saved ingredients succeeded in Ingredient View")
            return decodedIngredients
        } catch {
            DataPersistenceError.decodingFailed
            print("here's a parsing error")
            return nil
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
            .environmentObject(HomeBar())
    }
}
