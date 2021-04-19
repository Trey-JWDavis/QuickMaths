//
//  TVMViewModel.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/31/21.
//

import SwiftUI

class TVMViewModel: ObservableObject {
    @Published var calculator: TVMCalculator
    
    init() {
        calculator = TVMCalculator()
    }
    
    
    // MARK: Access
    var presentValue: String {
        get { "\(calculator.presentValue)" }
        set { calculator.presentValue = (newValue as NSString).doubleValue }
    }
    var paymentsPerYear: String {
        get { "\(calculator.paymentsPerYear)" }
        set {
            switch newValue {
                case "Annually":     calculator.paymentsPerYear = 1
                case "Semiannually": calculator.paymentsPerYear = 2
                case "Quarterly":    calculator.paymentsPerYear = 4
                case "Monthly":      calculator.paymentsPerYear = 12
                case "Weekly":       calculator.paymentsPerYear = 52
                case "Daily":        calculator.paymentsPerYear = 365
                default: calculator.paymentsPerYear = 1
            }
        }
    }
    var numberOfYears: String {
        get { "\(calculator.numberOfYears)" }
        set { calculator.numberOfYears = (newValue as NSString).doubleValue }
    }
    var interest: String {
        get { "\(calculator.interest)" }
        set { calculator.interest = (newValue as NSString).doubleValue }
    }
    var paymentAmount: String {
        get { "\(calculator.paymentAmount)" }
        set { calculator.paymentAmount = (newValue as NSString).doubleValue }
    }
    var futureValue: String {
        get { "\(calculator.futureValue)" }
        set { calculator.futureValue = (newValue as NSString).doubleValue }
    }
    
    
    // MARK: Intents
    func calcFutureValue() {
        calculator.calcFutureValue()
    }

    func calcPayment() {
        calculator.calcPayment()
    }
    
    func calcPresentValue() {
        calculator.calcPresentValue()
    }
    
    func calcInterest() {
        calculator.calcInterest()
    }
}
