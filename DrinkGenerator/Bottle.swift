//
//  Bottle.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

struct Bottle: Identifiable, Hashable, Comparable {
    static func < (lhs: Bottle, rhs: Bottle) -> Bool {
        lhs.name < rhs.name
    }
    
    var name: String
    var id = UUID()
    
    //var category: String
}
