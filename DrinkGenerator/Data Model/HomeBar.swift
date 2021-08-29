//
//  HomeBar.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/27/21.
//

import Foundation

class HomeBar: ObservableObject {
    @Published var bottleList = Set<Bottle>()
    
    func add(_ bottles: [Bottle], from selections: Set<UUID>) {
        let newItems = bottles.filter { selections.contains($0.id) }
        for item in newItems {
            bottleList.insert(item)
        }
    }
}
