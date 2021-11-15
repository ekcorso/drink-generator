//
//  ReceipeTextView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 11/14/21.
//

import SwiftUI

struct ReceipeTextView: View {
    let detailedRecipe: Recipe
    
    var body: some View {
        Text(buildRecipeText(recipe: detailedRecipe))
    }
    
    func buildRecipeText(recipe: Recipe) -> String {
        var text = ""
        if let ingredient1 = recipe.strIngredient1 {
            if let measure1 = recipe.strMeasure2 {
                text += "\(measure1) "
            }
            text += "\(ingredient1) \n"
        }
        if let ingredient2 = recipe.strIngredient2 {
            if let measure2 = recipe.strMeasure2 {
                text += "\(measure2) "
            }
            text += "\(ingredient2) \n"
        }
        if let ingredient3 = recipe.strIngredient3 {
            if let measure3 = recipe.strMeasure3 {
                text += "\(measure3) "
            }
            text += "\(ingredient3) \n"
        }
        if let ingredient4 = recipe.strIngredient4 {
            if let measure4 = recipe.strMeasure4 {
                text += "\(measure4) "
            }
            text += "\(ingredient4) \n"
        }
        if let ingredient5 = recipe.strIngredient5 {
            if let measure5 = recipe.strMeasure5 {
                text += "\(measure5) "
            }
            text += "\(ingredient5) \n"
        }
        if let ingredient6 = recipe.strIngredient6 {
            if let measure6 = recipe.strMeasure6 {
                text += "\(measure6) "
            }
            text += "\(ingredient6) \n"
        }
        if let ingredient7 = recipe.strIngredient7 {
            if let measure7 = recipe.strMeasure7 {
                text += "\(measure7) "
            }
            text += "\(ingredient7) \n"
        }
        if let ingredient8 = recipe.strIngredient8 {
            if let measure8 = recipe.strMeasure8 {
                text += "\(measure8) "
            }
            text += "\(ingredient8) \n"
        }
        if let ingredient9 = recipe.strIngredient9 {
            if let measure9 = recipe.strMeasure9 {
                text += "\(measure9) "
            }
            text += "\(ingredient9) \n"
        }
        if let ingredient10 = recipe.strIngredient10 {
            if let measure10 = recipe.strMeasure10 {
                text += "\(measure10) "
            }
            text += "\(ingredient10) \n"
        }
        if let ingredient11 = recipe.strIngredient11 {
            if let measure11 = recipe.strMeasure11 {
                text += "\(measure11) "
            }
            text += "\(ingredient11) \n"
        }
        if let ingredient12 = recipe.strIngredient12 {
            if let measure12 = recipe.strMeasure12 {
                text += "\(measure12) "
            }
            text += "\(ingredient12) \n"
        }
        if let ingredient13 = recipe.strIngredient13 {
            if let measure13 = recipe.strMeasure13 {
                text += "\(measure13) "
            }
            text += "\(ingredient13) \n"
        }
        if let ingredient14 = recipe.strIngredient14 {
            if let measure14 = recipe.strMeasure14 {
                text += "\(measure14) "
            }
            text += "\(ingredient14) \n"
        }
        if let ingredient15 = recipe.strIngredient15 {
            if let measure15 = recipe.strMeasure15 {
                text += "\(measure15) "
            }
            text += "\(ingredient15) \n"
        }
        return text
    }
}

struct ReceipeTextView_Previews: PreviewProvider {
    static var previews: some View {
        ReceipeTextView(detailedRecipe: Recipe.example)
    }
}
