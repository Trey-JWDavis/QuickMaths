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
                    .padding(.horizontal)
                    .tabItem {
                        Text("TVM")
                    }
                    
                Text("Second")
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
