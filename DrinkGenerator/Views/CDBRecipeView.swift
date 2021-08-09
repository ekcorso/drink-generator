//
//  CDBRecipeView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/6/21.
//

import SwiftUI

struct CDBRecipeView: View {
    
    let drinkList: [DrinkList] = {
        // TODO: break this url into base + search params. This URL is currently hardcoded to show stubs for recipes with Dry Vermouth and Gin
        let urlString = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=Dry_Vermouth,Gin"
        let cocktailAPI = CocktailAPI()
        let drinks = cocktailAPI.decode(DrinkList.self, from: urlString).drinks
        
        var drinkList = [DrinkList]()
        for drinkStub in drinkList {
            let drinkName = drinkStub.strIngredient1
            bottles.append(Bottle(name: bottleName.capitalized))
        }
        
        return bottles.sorted()
        
        
    }()
    
    var body: some View {
        List {
            
        }
    }
}

struct CDBRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CDBRecipeView()
    }
}
