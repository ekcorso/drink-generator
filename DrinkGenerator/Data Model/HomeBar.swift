//
//  HomeBar.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/27/21.
//

import Foundation

class HomeBar: ObservableObject {
    @Published var allIngredients: [Bottle]?
    @Published private(set) var bottleList = Set<Bottle>()
    @Published var selectedBottle: Bottle?
    
    init() {
        self.bottleList = Set(DataStorage().retrieve(data: .bottleList) ?? [])
        self.selectedBottle = DataStorage().retrieveSelectedIngredient() ?? Bottle(name: "None")
        
        if let ingredients = CocktailAPI.ingredients {
            allIngredients = ingredients
        } else {
            allIngredients = DataStorage().retrieve(data: .ingredients)
        }
        
    }
    
    func setSelectedBottle(bottle: Bottle?) {
        if let bottle = bottle {
            self.selectedBottle = bottle
            try? DataStorage().saveSelectedBottle(data: bottle)
        }
    }
    
    func update(_ selections: Set<UUID>, from bottles: [Bottle]) {
        let currentBottles = bottles.filter { selections.contains($0.id) }
        self.bottleList = Set(currentBottles)
    }
    
    func delete(_ offsets: IndexSet, from bottles: [Bottle]) {
        var editedBottleList = bottles
        editedBottleList.remove(atOffsets: offsets)
        self.bottleList = Set(editedBottleList)
        try? DataStorage().save(data: Array(bottleList), type: .bottleList)
    }
    
    func add(_ selections: Set<UUID>, from bottles: [Bottle]) {
        //user should not have to provide bottles to this nor the other methods in this class
        let bottlesToAdd = bottles.filter { selections.contains($0.id) }
        for bottle in bottlesToAdd {
            self.bottleList.insert(bottle)
        }
        try? DataStorage().save(data: Array(self.bottleList), type: .bottleList)
    }
}
