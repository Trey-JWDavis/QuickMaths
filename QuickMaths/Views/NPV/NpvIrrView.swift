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
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Present Value: ")
                    Spacer()
                    NumericTextField(input: $calculator.holdingPeriod).frame(width: geometry.size.width / 3)
                }
                List {
                    ForEach(0..<Int(calculator.holdingPeriod)) { index in
                        //TextField("", text: $calculator.cashflows[index])
                    }
                }
            }
            .multilineTextAlignment(.trailing)
            .listStyle(PlainListStyle())
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct NpvIrrView_Previews: PreviewProvider {
    static var previews: some View {
        NpvIrrView(calculator: NpvIrrViewModel())
    }
}
