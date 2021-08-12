//
//  ImageLoader.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 8/11/21.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            //print("data was updated")
            didChange.send(data)
        }
    }
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else {
            //print("could not cast the string as a URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                //print("could not fetch data")
                return
            }
            DispatchQueue.main.async {
                //print("imageLoader data var was updated with the data from dataTask")
                self.data = data
            }
        }
        task.resume()
    }
}
