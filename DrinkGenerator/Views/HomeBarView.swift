//
//  HomeBarView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 9/14/21.
//

import SwiftUI

struct HomeBarView: View {
    @EnvironmentObject var homeBar: HomeBar
    var ingredients: [Bottle] {
        Array(homeBar.bottleList)
    }
    
    var body: some View {
        NavigationView {
//            Section {
//                Text("Bottles in your home bar:")
//            }
            Section {
                List {
                    ForEach(ingredients) { bottle in
                        Text(bottle.name)
                    }
                }
            }
            .navigationTitle("Home Bar")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBarView()
            .environmentObject(HomeBar())
    }
}
