//
//  HomeBar.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/27/21.
//

import Foundation

class HomeBar: ObservableObject {
    @Published var bottleList = Set<UUID>()
}
