//
//  HomeBar.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/27/21.
//

import Foundation

class HomeBar: ObservableObject {
    @Published var bottleList = Set<Bottle>()
    
    func update(_ selections: Set<UUID>, from bottles: [Bottle]) {
        let currentBottles = bottles.filter { selections.contains($0.id) }
        self.bottleList = Set(currentBottles)
    }
    
    func delete(_ offsets: IndexSet, from bottles: [Bottle]) {
        var editedBottleList = bottles
        editedBottleList.remove(atOffsets: offsets)
        self.bottleList = Set(editedBottleList)
    }
    
    func add(_ selections: Set<UUID>, from bottles: [Bottle]) {
        let bottlesToAdd = bottles.filter { selections.contains($0.id) }
        for bottle in bottlesToAdd {
            self.bottleList.insert(bottle)
        }
    }
}
