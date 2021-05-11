//
//  InputList.swift
//  QuickMaths
//
//  Created by Trey Davis on 5/4/21.
//

import SwiftUI

struct InputList: View {
    @ObservedObject var calculator: TVMViewModel
    private var size: CGSize
    private var currencyFormatter: NumberFormatter
    private var percentFormatter: NumberFormatter
    
    init(calc: TVMViewModel, size: CGSize) {
        calculator = calc
        self.size = size
        
        currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        percentFormatter = NumberFormatter()
        percentFormatter.numberStyle = .percent
        percentFormatter.usesSignificantDigits = true
        percentFormatter.maximumSignificantDigits = 4
    }
    
    var body: some View {
        List {
            HStack {
                Text("Present Value: ")
                Spacer()
                NumericTextField(input: $calculator.presentValue, formatter: currencyFormatter).frame(width: textFieldWidth)
            }
            HStack {
                Text("Payment Amount: ")
                Spacer()
                NumericTextField(input: $calculator.paymentAmount, formatter: currencyFormatter).frame(width: textFieldWidth)
            }
            HStack {
                Text("Compounded:")
                Spacer()
                PeriodPicker(n: $calculator.paymentsPerYear)
                    .pickerStyle(MenuPickerStyle())
            }
            HStack {
                Text("Years: ")
                Spacer()
                NumericTextField(input: $calculator.numberOfYears).frame(width: textFieldWidth)
            }
            HStack {
                Text("Interest: ")
                Spacer()
                NumericTextField(input: $calculator.interest, formatter: percentFormatter)
                    .frame(width: textFieldWidth)
            }
            HStack {
                Text("Future Value: ")
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
extension InputList {
    var textFieldWidth: CGFloat { size.width / 3 }
}

struct InputList_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            InputList(calc: TVMViewModel(), size: geo.size)
        }
    }
}
