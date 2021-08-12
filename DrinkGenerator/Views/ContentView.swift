//
//  ContentView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Text("First, please select up to 10 bottles that you'd like to find cocktails with")
                
                Section(header: Text("Add bottles from your home bar")) {
                    NavigationLink(destination: IngredientView()) {
                        Text("Select bottles")
                    }
                }
                
                Section(header: Text("Ready to see some cocktail options?")) {
                    Button("Show me Mr. Potatohead-style recipe ideas") {
                        showCocktailCombos()
                        //Use navigation link here instead
                    }
                    Section {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .onReceive(imageLoader.didChange) { data in
                                self.image = UIImage(data: data) ?? UIImage()
                            }
                    }
                    NavigationLink(destination: RecipeListView()) {
                        Text("Show me tried and true recipes")
                    }
                }
                
            }
            .navigationTitle("Cocktail Generator")
        }
    }
    
    func showCocktailCombos() {
        //Take user to generated combos page
        //Pass values from home bar to that page
    }
    func showCocktailDbRecipes() {
        //Take user to a list of recipes from the cocktail db containing any of the selected ingredients
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(withURL: DrinkStub.example.strDrinkThumb)
    }
}
