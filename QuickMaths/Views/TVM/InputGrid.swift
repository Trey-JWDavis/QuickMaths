//
//  InputList.swift
//  QuickMaths
//
//  Created by Trey Davis on 5/4/21.
//

import SwiftUI

struct InputGrid: View {
    @ObservedObject var calculator: TVMViewModel
    private var size: CGSize
    private var currencyFormatter: NumberFormatter
    private var percentFormatter: NumberFormatter
    
    init(calc: TVMViewModel, size: CGSize) {
        calculator = calc
        self.size = size
        
        currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.minimumFractionDigits = 0
        currencyFormatter.maximumFractionDigits = 2
        
        percentFormatter = NumberFormatter()
        percentFormatter.numberStyle = .percent
        percentFormatter.minimumFractionDigits = 0
        percentFormatter.maximumFractionDigits = 2
        percentFormatter.usesSignificantDigits = true
        percentFormatter.maximumSignificantDigits = 4
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    hideKeyboard()
                    calculator.calcPresentValue()
                }) { Text("Present Value") }
                .buttonStyle(CalculatorButtonStyle(width: buttonWidth))
                
                Spacer()
                NumericTextField(input: $calculator.presentValue, formatter: currencyFormatter).frame(width: textFieldWidth)
            }
            HStack {
                Button(action: {
                    hideKeyboard()
                    calculator.calcPayment()
                }) { Text("Payments") }
                .buttonStyle(CalculatorButtonStyle(width: buttonWidth))
                Spacer()
                NumericTextField(input: $calculator.paymentAmount, formatter: currencyFormatter).frame(width: textFieldWidth)
            }
            HStack {
                Text("Compounded:")
                Spacer()
                PeriodPicker(n: $calculator.paymentsPerYear)
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            HStack {
                Button(action: {
                    hideKeyboard()
                    calculator.calcYears()
                }) { Text("Years") }
                .buttonStyle(CalculatorButtonStyle(width: buttonWidth))
                Spacer()
                NumericTextField(input: $calculator.numberOfYears).frame(width: textFieldWidth)
            }
            HStack {
                Button(action: {
                    hideKeyboard()
                    calculator.calcInterest()
                }) { Text("Interest") }
                .buttonStyle(CalculatorButtonStyle(width: buttonWidth))
                Spacer()
                NumericTextField(input: $calculator.interest, formatter: percentFormatter)
                    .frame(width: textFieldWidth)
            }
            HStack {
                Button(action: {
                    hideKeyboard()
                    calculator.calcFutureValue()
                }) { Text("Future Value") }
                .buttonStyle(CalculatorButtonStyle(width: buttonWidth))
                Spacer()
                NumericTextField(input: $calculator.futureValue, formatter: currencyFormatter).frame(width: textFieldWidth)
            }
        }
            .multilineTextAlignment(.trailing)
            .listStyle(PlainListStyle())
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

// Tuning Variables
extension InputGrid {
    var textFieldWidth: CGFloat { size.width / 2 }
    var buttonWidth: CGFloat { size.width / 2.5 }
}

struct InputList_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            InputGrid(calc: TVMViewModel(), size: geo.size)
        }
    }
}
