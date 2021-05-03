//
//  NumericTextField.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/30/21.
//

import SwiftUI
import Combine

import SwiftUI
import Combine

struct NumericTextField: View {
    @Binding var input: Double
    @State private var inputString: String = ""
    @State private var isEditing = false

    
    var body: some View {
        TextField("Enter a number...",
                  text: Binding(get: {
                    if isEditing {
                        return inputString
                    } else {
                        return "\(input)"
                    }
                  }, set: { str in
                    inputString = str
                    input = Double(inputString) ?? 0
                  }),
                  onEditingChanged: { editing in
                    inputString = input == 0 ? "" : "\(input)"
                    isEditing = editing
                    if !editing {
                        inputString = ""
                    }
                  })
            .onReceive(Just(inputString)) { newValue in
                let newValueString = "\(newValue)"
                let filtered = newValueString.filter { "0123456789.-".contains($0) }
                if filtered != newValueString {
                    print(filtered, "!=", newValueString)
                    inputString = filtered
                    input = Double(inputString) ?? 0
                }
            }
            .keyboardType(.decimalPad)
    }
}
