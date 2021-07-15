//
//  CalculatorButton.swift
//  QuickMaths
//
//  Created by Trey Davis on 5/4/21.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    
    var width: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
//                .padding(8)
                .frame(width: width, height: 35)
                .foregroundColor(.white)
                .background(
//                    LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    Color.blue
                        .opacity(configuration.isPressed ? 0.5 : 1)
                )
                .cornerRadius(10)
                .shadow(radius: 3)
    }
}
