//
//  DrinkGeneratorApp.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/15/21.
//

import SwiftUI

@main
struct DrinkGeneratorApp: App {
    @StateObject var homeBar = HomeBar()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HomeBar())
        }
    }
}
