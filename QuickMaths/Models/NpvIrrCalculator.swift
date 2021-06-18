//
//  NpvIrrCalculator.swift
//  QuickMaths
//
//  Created by Trey Davis on 4/19/21.
//

import Foundation

struct NpvIrrCalculator {
    var holdingPeriod: Double
    var npv: Double
    var irr: Double
    var cashflows: [Double]
    var presentValue: Double
    var futureValue: Double
    
    init() {
        holdingPeriod = 0
        npv = 0
        irr = 0
        cashflows = []
        presentValue = 0
        futureValue = 0
    }
    
    func calcIRR() {
        
    }
    
    func calcNPV() {
        
    }
}
