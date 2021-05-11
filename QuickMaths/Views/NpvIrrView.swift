//
//  NpvIrrView.swift
//  QuickMaths
//
//  Created by Trey Davis on 4/19/21.
//

import SwiftUI

struct NpvIrrView: View {
    @ObservedObject var calculator: NpvIrrViewModel
    
    @State private var years: Double = 1
    
    var body: some View {
        VStack {
            HStack {
                Text("Holding period (years):")
                NumericTextField(input: $years)
            }
            List {
                ForEach(0..<Int(calculator.holdingPeriod)) { index in
                    //TextField("", text: $calculator.cashflows[index])
                }
            }
        }.padding()
    }
}

struct NpvIrrView_Previews: PreviewProvider {
    static var previews: some View {
        NpvIrrView(calculator: NpvIrrViewModel())
    }
}
