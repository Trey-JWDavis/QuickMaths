//
//  TVMView.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/29/21.
//

import SwiftUI
import Combine

struct TVMView: View {
    
    @ObservedObject var calculator: TVMViewModel
    
    @State private var pv = ""
    @State private var pmt = ""
    @State private var n: Periods = .annually
    @State private var t = ""
    @State private var i = ""
    @State private var fv = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                List {
                    HStack {
                        Text("Present Value: ")
                        Spacer()
                        NumericTextField(input: $pv).frame(width: 150)
                    }
                    HStack {
                        Text("Payment Amount: ")
                        Spacer()
                        NumericTextField(input: $pmt).frame(width: 150)
                    }
                    HStack {
                        Text("Compounded:")
                        Spacer()
                        PeriodPicker(n: $n)
                            .pickerStyle(MenuPickerStyle())
                    }
                    HStack {
                        Text("Years: ")
                        Spacer()
                        NumericTextField(input: $t).frame(width: 150)
                    }
                    HStack {
                        Text("Interest: ")
                        Spacer()
                        NumericTextField(input: $i).frame(width: 150)
                    }
                    HStack {
                        Text("Future Value: ")
                        Spacer()
                        NumericTextField(input: $fv).frame(width: 150)
                    }
                }
                    .multilineTextAlignment(.trailing)
                    .padding(.horizontal)
                    .listStyle(PlainListStyle())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Spacer()
                    Button(action: {
                        pv = ""
                        pmt = ""
                        n = .annually
                        t = ""
                        i = ""
                        fv = ""
                    }, label: {
                        Text("Clear All Values")
                    })
                }.padding()
                
                HStack {
                    Button(action: {
                        hideKeyboard()
                        saveValues()
                        
                        calculator.calcPresentValue()
                        pv = calculator.presentValue
                    }, label: {
                        Text("PV")
                    })
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                        saveValues()
                        
                        calculator.calcInterest()
                        i = calculator.interest
                    }, label: {
                        Text("I/YR")
                    })
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                        saveValues()
                        
                        calculator.calcPayment()
                        pmt = calculator.paymentAmount
                    }, label: {
                        Text("PMT")
                    })
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                        saveValues()
                        
                        calculator.calcFutureValue()
                        fv = calculator.futureValue
                    }, label: {
                        Text("FV")
                    })
                }.padding()
            }
                .onTapGesture {
                    hideKeyboard()
                }
            //.keyboardType(.decimalPad)
        }
    }
    
    func saveValues() {
        calculator.presentValue = pv
        calculator.paymentAmount = pmt
        calculator.paymentsPerYear = n.rawValue
        calculator.numberOfYears = t
        calculator.interest = i
        calculator.futureValue = fv
    }
    
    func printAllCalcValues() {
        print("pv: ", calculator.presentValue)
        print("pmt: ", calculator.paymentAmount)
        print("n: ", calculator.paymentsPerYear)
        print("t: ", calculator.numberOfYears)
        print("i: ", calculator.interest)
        print("fv: ", calculator.futureValue)
    }
}



#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct TVMView_Previews: PreviewProvider {
    static var previews: some View {
        TVMView(calculator: TVMViewModel())
    }
}
