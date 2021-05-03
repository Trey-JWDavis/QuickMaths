//
//  NpvIrrViewModel.swift
//  QuickMaths
//
//  Created by Trey Davis on 4/19/21.
//

import SwiftUI

class NpvIrrViewModel: ObservableObject {
    @Published var calculator: NpvIrrCalculator
    
    init() {
        calculator = NpvIrrCalculator()
    }
    
    // Access
    var holdingPeriod: Double {
        get { calculator.holdingPeriod }
        set { calculator.holdingPeriod = newValue }
    }
    var presentValue: String {
        get { "\(calculator.presentValue)" }
        set { calculator.presentValue = (newValue as NSString).doubleValue }
    }
    var futureValue: String {
        get { "\(calculator.futureValue)" }
        set { calculator.futureValue = (newValue as NSString).doubleValue }
    }
//    var cashflows: [String] {
//        get { calculator.cashflows }
//        set { calculator.cashflows }
//    }
    
    // Intents
}
