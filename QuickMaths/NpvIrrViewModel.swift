//
//  NpvIrrViewModel.swift
//  QuickMaths
//
//  Created by Trey Davis on 4/19/21.
//

import SwiftUI

class NpvIrrViewModel {
    @Published var calculator: NpvIrrCalculator
    
    init() {
        calculator = NpvIrrCalculator()
    }
}
