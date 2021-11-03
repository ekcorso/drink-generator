//
//  IngredientView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/5/21.
//

import SwiftUI
import Network

struct IngredientView: View {
    @EnvironmentObject var homeBar: HomeBar
    private let monitor = NWPathMonitor()
    
    var bottles: [Bottle] {
        if let networkStatus = Network().checkNetworkAvailability() {
            let bottles = CocktailAPI.ingredients
            try? save(bottles)
            return bottles
        } else {
            if let bottles = getIngredientsDataFromDirectory() {
                return bottles
            }
        }
        
        print("How did we get here?")
        return [Bottle.example1, Bottle.example2, Bottle.example3]
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
                Section {
                    Button("Network status") {
                        let network = Network()
                        print(network.checkNetworkAvailability() ?? "No value")
                    }
                }
            }
            .navigationTitle("Cocktail Ingredients")
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear {
                homeBar.add(selectedBottleIds, from: bottles)
            }
        }
    }
    
    private enum DataPersistenceError: Error {
        case saveFailed
        case decodingFailed
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
            print("succeeded")
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
