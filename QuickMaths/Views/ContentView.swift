//
//  ContentView.swift
//  QuickMaths
//
//  Created by Trey Davis on 3/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                TVMView(calculator: TVMViewModel())
                    .tabItem { Image(systemName: "dollarsign.circle") }
                
                NpvIrrView(calculator: NpvIrrViewModel())
                    .tabItem { Image(systemName: "clock.arrow.circlepath") }
            }
            .navigationTitle("Time Value of Money")
            .navigationBarItems(trailing: Button(action: {
                // Save here
            }, label: {
                Image(systemName: "square.and.arrow.down")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
