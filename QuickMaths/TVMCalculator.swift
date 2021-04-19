//
//  TVMCalculator.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/31/21.
//

import Foundation

struct TVMCalculator {
    var presentValue: Double
    var paymentAmount: Double
    var paymentsPerYear: Double
    var numberOfYears: Double
    var interest: Double
    var futureValue: Double
    
    init() {
        presentValue = 0
        paymentsPerYear = 0
        numberOfYears = 0
        interest = 0
        paymentAmount = 0
        futureValue = 0
    }
    
    mutating func calcFutureValue() {
        
        if (presentValue == 0) {
            futureValue = (paymentAmount / interest) * (pow((1 + interest), numberOfYears) - 1)
        } else {
            futureValue = presentValue * pow((1 + (interest / paymentsPerYear)),(paymentsPerYear * numberOfYears))
        }
    }

    mutating func calcPayment() {
        if (futureValue == 0) {
            paymentAmount = -presentValue *
                ((interest / paymentsPerYear) * pow(1 + (interest / paymentsPerYear), paymentsPerYear * numberOfYears)) /
                (pow(1 + (interest / paymentsPerYear), paymentsPerYear * numberOfYears) - 1)
        } else {
            paymentAmount = futureValue / ( (pow((1 + (interest / paymentsPerYear)),(paymentsPerYear * numberOfYears)) - 1) / (interest / paymentsPerYear) )
        }
        
    }
    
    mutating func calcPresentValue() {
        presentValue = futureValue / pow((1 + interest), numberOfYears)
    }
    
    mutating func calcInterest() {
        if (paymentAmount == 0) {
            interest = pow((futureValue / presentValue), (1 / (paymentsPerYear * numberOfYears))) - 1
        } else {
            interest = IRR(numOfCashflows: Int(paymentsPerYear * numberOfYears))
        }
    }
    
    // Accurate within 0.00001 percent
    // If no result after 20 tries, -1 is returned
    func IRR(numOfCashflows cashflows: Int, precision: Double = 0.00001, maxIterations: Int = 20) -> Double {
        var npv: Double
        var denom: Double = 0
        var oldNPV: Double = 0
        var currentNPV: Double = 0
        
        var lowGuessRate = 0.01
        var highGuessRate = 0.49
        var guessRate: Double {
            (lowGuessRate + highGuessRate) / 2
        }
        
        for _ in 0..<maxIterations {
            npv = presentValue
            for j in 0..<cashflows {
                denom = pow(1 + (guessRate / paymentsPerYear), Double(j + 1))
                npv += (paymentAmount / denom)
            }
            npv += (futureValue / denom)
            
            if (npv > 0) && (npv < precision) {
                return guessRate
            }
            
            if (oldNPV == 0) {
                oldNPV = npv
            } else {
                oldNPV = currentNPV
            }
            currentNPV = npv
            
            if currentNPV > 0 {
                lowGuessRate = guessRate
            } else {
                highGuessRate = guessRate
            }
        }
        return guessRate
    }
}
