//
//  IngredientList.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/26/21.
//

import Foundation

struct IngredientList: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let strIngredient1: String
}
