//
//  DrinkList.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/8/21.
//

import Foundation

struct DrinkList: Codable {
    let drinks: [DrinkStub]
}

struct DrinkStub: Codable {
    let idDrink: Int
    let strDrink: String
    
    //should this be a URL?
    let strDrinkThumb: String
}

extension DrinkStub: Identifiable {
    var id: Int { return idDrink }
}

extension DrinkStub: Comparable {
    static func < (lhs: DrinkStub, rhs: DrinkStub) -> Bool {
        lhs.strDrink < rhs.strDrink
    }
}
