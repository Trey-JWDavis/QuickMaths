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
                InputGrid(calc: calculator, size: geometry.size)
                
                Button(action: {
                    calculator.clear()
                }, label: {
                    Text("Clear All")
                })
                    .padding()
                    .buttonStyle(CalculatorButtonStyle(width: geometry.size.width / 2))
                
                Spacer()
            }.padding()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct TVMView_Previews: PreviewProvider {
    static var previews: some View {
        TVMView(calculator: TVMViewModel())
    }
}
