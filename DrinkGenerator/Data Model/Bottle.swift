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
    var snakeName: String {
        return name.replacingOccurrences(of: " ", with: "_")
    }

    //var category: String
    
    static let example1 = Bottle(name: "Whiskey")
    static let example2 = Bottle(name: "Gin")
    static let example3 = Bottle(name: "Sweet_Vermouth")
    static let example4 = Bottle(name: "Campari")
    
    func hash(into hasher: inout Hasher) {
        //hasher.combine(name)
        hasher.combine(id)
    }
    
    init(name: String) {
        self.name = name
    }
}

extension Bottle: Comparable, Equatable {
    static func < (lhs: Bottle, rhs: Bottle) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: Bottle, rhs: Bottle) -> Bool {
        lhs.name == rhs.name
    }
}
