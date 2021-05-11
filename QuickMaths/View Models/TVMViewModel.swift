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
    var presentValue: Double {
        get { calculator.presentValue! }
        set { calculator.presentValue = newValue }
    }
    
    var paymentsPerYear: Period {
        get {
            switch calculator.paymentsPerYear {
                case 1:     return .annually
                case 2:     return .semiannually
                case 4:     return .quarterly
                case 12:    return .monthly
                case 52:    return .weekly
                case 365:   return .daily
                default:    return .annually
            }
        }
        set {
            switch newValue {
                case .annually:     calculator.paymentsPerYear = 1
                case .semiannually: calculator.paymentsPerYear = 2
                case .quarterly:    calculator.paymentsPerYear = 4
                case .monthly:      calculator.paymentsPerYear = 12
                case .weekly:       calculator.paymentsPerYear = 52
                case .daily:        calculator.paymentsPerYear = 365
            }
        }
    }
    
    var numberOfYears: Double {
        get { calculator.numberOfYears }
        set { calculator.numberOfYears = newValue }
    }
    
    var interest: Double {
        get { calculator.interest }
        set { calculator.interest = newValue }
    }
    
    var paymentAmount: Double {
        get { calculator.paymentAmount }
        set { calculator.paymentAmount = newValue }
    }
    
    var futureValue: Double {
        get { calculator.futureValue }
        set { calculator.futureValue = newValue }
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
    
    func clear() {
        calculator.clear()
    }
}
