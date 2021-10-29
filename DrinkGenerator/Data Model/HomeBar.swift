//
//  HomeBar.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/27/21.
//

import Foundation

class HomeBar: ObservableObject {
    @Published private(set) var bottleList = Set<Bottle>()
    @Published var selectedBottle: Bottle?

    enum DataPersistenceError: Error {
        case saveFailed
        case decodingFailed
    }
    
    init() {
        getBottleListDataFromDirectory()
    }
    
    func setSelectedBottle(bottle: Bottle?) {
        if let bottle = bottle {
            self.selectedBottle = bottle
        }
        // save
    }
    
    func update(_ selections: Set<UUID>, from bottles: [Bottle]) {
        let currentBottles = bottles.filter { selections.contains($0.id) }
        self.bottleList = Set(currentBottles)
    }
    
    func delete(_ offsets: IndexSet, from bottles: [Bottle]) {
        var editedBottleList = bottles
        editedBottleList.remove(atOffsets: offsets)
        self.bottleList = Set(editedBottleList)
        try? save()
    }
    
    func add(_ selections: Set<UUID>, from bottles: [Bottle]) {
        //user should not have to provide bottles to this nor the other methods in this class
        let bottlesToAdd = bottles.filter { selections.contains($0.id) }
        for bottle in bottlesToAdd {
            self.bottleList.insert(bottle)
        }
        try? save()
    }
    
    private func getBottleListDataFromDirectory() {
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent("bottleList.txt")
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedBottleList = try JSONDecoder().decode(Set<Bottle>.self, from: jsonData)
            self.bottleList = decodedBottleList
        } catch {
            DataPersistenceError.decodingFailed
            print("here's a parsing error")
        }
    }
    
    private func save() throws {
        guard let encoded = try? JSONEncoder().encode(bottleList) else {
            print("encoding failed")
            DataPersistenceError.saveFailed
            return
        }
        
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent("bottleList.txt")
        
        do {
            try encoded.write(to: url)
        } catch {
            print("save failed")
        }
    }
}
