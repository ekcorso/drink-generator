//
//  Network.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 11/1/21.
//

import Foundation
import Network

class Network {
    private let monitor = NWPathMonitor()
    @Published var isAvailable: Bool?
    
    func checkNetworkAvailability() -> Bool? {

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isAvailable = true
            } else {
                self.isAvailable = nil
            }
            //print(path.isExpensive)
        }

        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        return isAvailable
    }
}
