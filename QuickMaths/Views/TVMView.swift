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
    @State private var inputString = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                List {
                    HStack {
                        Text("Present Value: ")
                        Spacer()
                        NumericTextField(input: $calculator.presentValue).frame(width: 150)
                    }
                    HStack {
                        Text("Payment Amount: ")
                        Spacer()
                        NumericTextField(input: $calculator.paymentAmount).frame(width: 150)
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
                        NumericTextField(input: $calculator.numberOfYears).frame(width: 150)
                    }
                    HStack {
                        Text("Interest: ")
                        Spacer()
                        NumericTextField(input: $calculator.interest).frame(width: 150)
                    }
                    HStack {
                        Text("Future Value: ")
                        Spacer()
                        NumericTextField(input: $calculator.futureValue).frame(width: 150)
                    }
                }
                    .multilineTextAlignment(.trailing)
                    .padding(.horizontal)
                    .listStyle(PlainListStyle())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                        calculator.clear()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).frame(width: 100, height: 35)
                            Text("Clear").foregroundColor(.white)
                        }
                    })
                }.padding()
                
                HStack {
                    Button(action: {
                        hideKeyboard()
                        
                        print("")
                        print("Calculating PV")
                        printAllCalcValues()
                        calculator.calcPresentValue()
                    }, label: {
                        Text("PV")
                    })
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                        
                        print("")
                        print("Calculating I/YR")
                        printAllCalcValues()
                        calculator.calcInterest()
                    }, label: {
                        Text("I/YR")
                    })
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                        print("")
                        print("Calculating PMT")
                        printAllCalcValues()
                        calculator.calcPayment()
                    }, label: {
                        Text("PMT")
                    })
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                        print("")
                        print("Calculating FV")
                        printAllCalcValues()
                        calculator.calcFutureValue()
                    }, label: {
                        Text("FV")
                    })
                }.padding()
            }
                .onTapGesture {
                    hideKeyboard()
                }
        }
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
