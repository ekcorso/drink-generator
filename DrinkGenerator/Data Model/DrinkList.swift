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
}
