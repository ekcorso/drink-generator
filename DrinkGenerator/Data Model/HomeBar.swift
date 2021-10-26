//
//  HomeBar.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/27/21.
//

import Foundation

class HomeBar: ObservableObject {
    @Published private(set) var bottleList = Set<Bottle>()
    static let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let bottleList = try? JSONDecoder().decode(Set<Bottle>.self, from: data) {
                self.bottleList = bottleList
                return
            }
        }
        
        self.bottleList = Set<Bottle>()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(bottleList) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
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
        save()
    }
    
    func add(_ selections: Set<UUID>, from bottles: [Bottle]) {
        //user should not have to provide bottles to this nor the other methods in this class
        let bottlesToAdd = bottles.filter { selections.contains($0.id) }
        for bottle in bottlesToAdd {
            self.bottleList.insert(bottle)
        }
        save()
    }
}
