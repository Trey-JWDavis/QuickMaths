//
//  NumericTextField.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/30/21.
//

/*
 Purpose of this view:
 1. Allow the user to enter only numeric values into a TextField
 2. Allow the user to supply a NumberFormatter for formatting
 3. Save the user's value without the need for an onCommit() call
 4. Internally format the input so that editing will be easier
*/

import SwiftUI
import Combine

struct NumericTextField: View {
    @Binding var input: Double
    var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    @State private var inputString = ""
    @State private var isEditing = false
    private var formattedText: String {
        formatter.string(from: NSNumber(value: input)) ?? ""
    }
    
    var body: some View {
        TextField("",
                  text: Binding(get: {
                    if isEditing {
                        return inputString
                    } else {
                        return formattedText
                    }
                  }, set: { str in
                    inputString = str
                  }),
                  onEditingChanged: { editing in
                    isEditing = editing
                    
                    if editing {
                        if formatter.numberStyle == .percent {
                            inputString = input == 0 ? "" : input.toPercentString()
                        } else {
                            inputString = input == 0 ? "" : input.toCurrencyString()
                        }
                    } else {
                        if formatter.numberStyle == .percent && Double(inputString) ?? 0 >= 1 {
                            input = (Double(inputString) ?? 0) / 100
                            inputString = input.toPercentString()
                        } else {
                            input = Double(inputString) ?? 0
                        }
                    }
                  })
            .onReceive(Just(inputString)) { newValue in
                let newValueString = "\(newValue)"
                let filtered = newValueString.filter { "0123456789.-".contains($0) }
                if filtered != newValueString {
                    print("Filtered:", filtered, "!= Published:", newValueString)
                    inputString = filtered
                }
            }
            .keyboardType(.decimalPad)
    }
}

extension Double {
    func toCurrencyString() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: number) ?? ""
    }
}

extension Double {
    func toPercentString() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 4
        formatter.minimumSignificantDigits = 0
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        
        return formatter.string(from: number) ?? ""
    }
}
