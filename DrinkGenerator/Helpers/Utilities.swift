//
//  Utilities.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 10/26/21.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // send back the first path, which should be the only one
        return paths[0]
    }
}
