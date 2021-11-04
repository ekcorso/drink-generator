//
//  DataPersistenceError.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 11/4/21.
//

import Foundation

enum DataPersistenceError: Error {
    case saveFailed
    case decodingFailed
}
