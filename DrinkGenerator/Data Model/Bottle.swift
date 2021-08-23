//
//  Bottle.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

class Bottle: Identifiable, Hashable, ObservableObject {
    
    var name: String
    var id = UUID()

    //var category: String
    
    static let example1 = Bottle(name: "Smith & Cross", id: UUID())
    static let example2 = Bottle(name: "Aria Gin", id: UUID())
    static let example3 = Bottle(name: "Combier", id: UUID())
    static let example4 = Bottle(name: "Suze", id: UUID())
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
    }
    
    init(name: String, id: UUID ) {
        self.name = name
        self.id = id
    }
}

extension Bottle: Comparable, Equatable {
    static func < (lhs: Bottle, rhs: Bottle) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: Bottle, rhs: Bottle) -> Bool {
        lhs.name == rhs.name
    }
}
