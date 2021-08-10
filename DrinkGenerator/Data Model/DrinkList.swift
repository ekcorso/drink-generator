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
    let idDrink: String
    let strDrink: String
    
    //should this be a URL?
    let strDrinkThumb: String
    
    static let example = DrinkStub(idDrink: "12420", strDrink: "Tuxedo Cocktail", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/4u0nbl1504352551.jpg")
    
}

extension DrinkStub: Identifiable {
    var id: Int { return Int(idDrink)! }
}

extension DrinkStub: Comparable {
    static func < (lhs: DrinkStub, rhs: DrinkStub) -> Bool {
        lhs.strDrink < rhs.strDrink
    }
}
