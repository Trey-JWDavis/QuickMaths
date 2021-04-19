//
//  NumericTextField.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/30/21.
//

import SwiftUI
import Combine

struct NumericTextField: View {
    
    var title: String = ""
    @Binding var input: String
    
    var body: some View {
        TextField(title, text: $input)
            .keyboardType(.decimalPad)
            .onReceive(Just(input)) { newValue in
                let filtered = newValue.filter { "0123456789.-".contains($0) }
                if filtered != newValue {
                    self.input = filtered
                }
            }
    }
}
