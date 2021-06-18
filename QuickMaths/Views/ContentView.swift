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
                    .padding()
                    .tabItem {
                        Text("TVM")
                    }
                    
                NpvIrrView(calculator: NpvIrrViewModel())
                    .padding()
                    .tabItem {
                        Text("NPV/IRR")
                    }
            }
            .navigationTitle("Time Value of Money")
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
