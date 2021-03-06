//
//  DataStorage.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 11/12/21.
//

import Foundation

struct DataStorage {
    
    func save(data: [Bottle], type dataType: DataType) throws {
        guard let encoded = try? JSONEncoder().encode(data) else {
            print("encoding failed")
            DataPersistenceError.saveFailed
            return
        }
        
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent(dataType.rawValue)
        
        do {
            try encoded.write(to: url)
        } catch {
            print("save failed")
        }
    }
    
    func retrieve(data: DataType) -> [Bottle]? {
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent(data.rawValue)
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([Bottle].self, from: jsonData)
            return decodedData
        } catch {
            DataPersistenceError.decodingFailed
            return nil
        }
    }
    
    func retrieveSelectedIngredient() -> Bottle? {
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent(DataType.selectedBottle.rawValue)
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(Bottle.self, from: jsonData)
            return decodedData
        } catch {
            DataPersistenceError.decodingFailed
            return nil
        }
    }
    
    func saveSelectedBottle(data: Bottle) throws {
        guard let encoded = try? JSONEncoder().encode(data) else {
            print("encoding failed")
            DataPersistenceError.saveFailed
            return
        }
        
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent(DataType.selectedBottle.rawValue)
        
        do {
            try encoded.write(to: url)
        } catch {
            print("save failed")
        }
    }
}
