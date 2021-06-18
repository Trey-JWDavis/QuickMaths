//
//  CalculatorButtonBar.swift
//  QuickMaths
//
//  Created by Trey Davis on 5/4/21.
//

import SwiftUI

struct CalculatorButtonBar: View {
    @ObservedObject var calculator: TVMViewModel
    var size: CGSize
    
    var body: some View {
        VStack(spacing: vSpacing) {
            
            
            HStack(spacing: hSpacing) {
                Button(action: {
                    hideKeyboard()
                    calculator.calcPresentValue()
                }) { Text("PV") }
                
                Button(action: {
                    hideKeyboard()
                    calculator.calcPayment()
                }) { Text("PMT") }
                
                Button(action: {
                    hideKeyboard()
                    calculator.calcYears()
                }, label: {
                    Text("YRs")
                })
                
                Button(action: {
                    hideKeyboard()
                    calculator.calcInterest()
                }) { Text("I/YR") }
            }
            
            HStack(spacing: hSpacing) {
                
                Button(action: {
                    hideKeyboard()
                    calculator.calcFutureValue()
                }) { Text("FV") }
                Spacer()
                
                Button(action: {
                    hideKeyboard()
                    // calculator.clear()
                }) { Text("Save") }
                
                Button(action: {
                    hideKeyboard()
                    calculator.clear()
                }) { Text("Clear") }
            }
        }
        .buttonStyle(CalculatorButtonStyle(width: buttonWidth))
    }
}


// Tuning Variables
extension CalculatorButtonBar {
    var buttonWidth: CGFloat { size.width / 5 }
    var hSpacing: CGFloat { buttonWidth / 3 }
    var vSpacing: CGFloat { 10 }
}

struct CalculatorButtonBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            CalculatorButtonBar(calculator: TVMViewModel(), size: geo.size)
        }
    }
}
