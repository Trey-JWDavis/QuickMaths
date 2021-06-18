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
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                InputList(calc: calculator, size: geometry.size)
                CalculatorButtonBar(calculator: calculator, size: geometry.size)
            }
                .onTapGesture {
                    hideKeyboard()
                }
        }
    }
}

struct TVMView_Previews: PreviewProvider {
    static var previews: some View {
        TVMView(calculator: TVMViewModel())
    }
}
