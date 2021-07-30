//
//  CheckView.swift
//  DrinkGenerator
//
//  Created by Emily Corso on 7/29/21.
//

import Foundation
import SwiftUI

struct CheckView: View {
    @State var isChecked: Bool = false
    var title: String
    func toggle() {
        isChecked = !isChecked
    }
    
    var body: some View {
        HStack{
            Image(systemName: isChecked ? "checkmark.circle" : "circle")
                .onTapGesture {
                    toggle()
                }
            Text(title)
        }
    }
}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(isChecked: false, title: "Dark Rum")
    }
}
