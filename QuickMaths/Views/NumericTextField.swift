//
//  NumericTextField.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/30/21.
//

/*
 The purpose of this view is as follows:
 1. Allow the user to enter numeric values into a textfield
 2. Allow the user to specifiy the formatting, decimal by default
 3. Save the user's value without the need for an onCommit() call
 4. Format the input so that editing will be easier
 5. Use Combine to only allow specific characters to be entered
 */

import SwiftUI
import Combine

struct NumericTextField: View {
    @Binding var input: Double
    var formatter: NumberFormatter = NumberFormatter()
    private var formattedInputString: String {
        formatter.string(from: NSNumber(value: input)) ?? "0"
    }
    
    @State private var inputString = ""
    @State private var isEditing = false
    
    var body: some View {
        TextField("",
                  text: Binding(get: {
                    if isEditing {
                        return inputString
                    } else {
                        return formattedInputString
                    }
                  }, set: { str in
                    inputString = str
                    if formatter.numberStyle == .percent && Double(str) ?? 0 >= 1 {
                        input = (Double(str) ?? 0) / 100
                    } else {
                        input = Double(str) ?? 0
                    }
                  }),
                  onEditingChanged: { editing in
                    if editing {
                        inputString = input == 0 ? "" : input.removeTrailingZeros()
                    }
                    isEditing = editing
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

extension Double {
    func removeTrailingZeros() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        
        return String(formatter.string(from: number) ?? "")
    }
}
