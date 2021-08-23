//
//  ComboGenerator.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/22/21.
//

import Foundation

struct ComboGenerator {
    func generateAllIngredientCombos(ingredients: [Bottle], takenBy: Int) -> [[Bottle]] {
        if(ingredients.count == takenBy) {
            return [ingredients]
        }

        if(ingredients.isEmpty) {
            return []
        }

        if(takenBy == 0) {
            return []
        }

        if(takenBy == 1) {
            return ingredients.map { [$0] }
        }

        var result: [[Bottle]] = []

        let rest = Array(ingredients.suffix(from: 1))
        let subCombos = generateAllIngredientCombos(ingredients: rest, takenBy: takenBy - 1)
        result += subCombos.map { [ingredients[0]] + $0 }
        result += generateAllIngredientCombos(ingredients: rest, takenBy: takenBy)
        return result
        
    }
    
    func selectRandomIngredientCombo(drinkCombos: [[Bottle]]) -> [Bottle]? {
        if let randomCombo = drinkCombos.randomElement() {
            return randomCombo
        } else {
            return nil
        }
    }
}
